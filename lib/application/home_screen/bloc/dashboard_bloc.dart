import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:esnya_shared_resources/core/core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:kt_dart/collection.dart';

import '../../../domain/core/utils.dart';
import '../../../domain/user_data/day_bucket_repository.dart';
import '../../../injection_environments.dart';
import '../../food_data/input/food_input_bloc.dart';
import '../../food_data/input/models/food_item_entry_wrapper.dart';

part 'dashboard_bloc.freezed.dart';
part 'dashboard_event.dart';
part 'dashboard_state.dart';

const kInitialBucketBatchSize = 10;
const kIncrementalBucketBatchSize = 10;
const kMinMillisecondsBetweenExtendBucketWatchRange = 2000;

@isolate1
@lazySingleton
class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  final DayBucketsRepository _dayBucketRepository;
  final FoodInputBloc _foodInputBloc;

  StreamSubscription<Either<Failure, KtList<DayBucket>>>?
      _bucketsStreamSubscription;
  late int _currentBatchSize;
  late DateTime _lastExtendBucketWatchRange;
  StreamSubscription<KtList<FoodItemEntryWrapper>>?
      _foodInputBlocEntriesSubscription;

  StreamSubscription<KtList<FoodItemEntry>>?
      _foodInputBlocOutgoingEntriesSubscription;

  DashboardBloc(this._dayBucketRepository, this._foodInputBloc)
      : super(DashboardState.initial()) {
    ////////////////////////////////////////////////////
    // initialization
    ////////////////////////////////////////////////////
    _lastExtendBucketWatchRange = DateTime.now();
    _currentBatchSize = kInitialBucketBatchSize;
    ////////////////////////////////////////////////////
    // setup event handlers
    ////////////////////////////////////////////////////
    on<DashboardEvent>((event, emit) async {
      await event.map(
        started: (_Started event) async {
          // cancel subscriptions just in case.
          await _cleanup();
          // listen to buckets from firestore
          _createBucketStreamSubscription(_currentBatchSize);
          // listen to entries from foodInputBloc

          _foodInputBlocEntriesSubscription =
              _foodInputBloc.blocEntries.stream.listen((entries) {
            add(DashboardEvent.foodInputBlocEntriesReceived(entries));
          });

          _foodInputBlocOutgoingEntriesSubscription =
              _foodInputBloc.outgoingEntries.listen((entries) {
            add(DashboardEvent.foodInputBlocOutgoingEntriesReceived(entries));
          });
        },
        foodInputBlocEntriesReceived: (_FoodInputBlocEntriesReceived event) {
          emit(state.copyWith(foodInputBlocEntries: event.entries));
        },
        foodInputBlocOutgoingEntriesReceived:
            (_FoodInputBlocOutgoingEntriesReceived event) async {
          // cache outgoing entries in state
          emit(state.copyWith(
              foodInputBlocOutgoingEntries:
                  state.foodInputBlocOutgoingEntries + event.entries));
          // store them in firebase. (When the firebase stream comes back they are removed from the state cache again)
          await _dayBucketRepository.createEntriesForToday(
            event.entries.iter,
          );
        },
        bucketsReceived: (_BucketsReceived event) async {
          event.failureOrBuckets.fold(
            (Failure failure) {
              emit(state.copyWith(
                dashboardBucketsState: DashboardBucketsState.failure,
              )); // TODO: also set buckets to [] or rather keep buckets from old state?
            },
            (KtList<DayBucket> buckets) {
              final arrivedIds =
                  _extractEntryIdsFromBucketListThatAreAlsoInBetweenEntries(
                      buckets);

              // update headerbucket if it has same id as a bucket that was received:
              final headerBucket =
                  (state.headerBucket == null && buckets.size >= 1)
                      ? buckets[0]
                      : buckets.find((e) => e.id == state.headerBucket?.id);

              emit(state.copyWith(
                headerBucket: headerBucket,
                dashboardBucketsState: DashboardBucketsState.loaded,
                buckets: buckets,
                foodInputBlocOutgoingEntries: state.foodInputBlocOutgoingEntries
                    .filter((e) => !arrivedIds.contains(e.id)),
              ));
            },
          );
        },
        extendBucketWatchRange: (_ExtendBucketWatchRange value) {
          // if last extend was less than for example 2 seconds ago we dont do anything.
          final now = DateTime.now();
          if (now.difference(_lastExtendBucketWatchRange).inMilliseconds <=
              kMinMillisecondsBetweenExtendBucketWatchRange) {
            return;
          }
          // add a new stream subscription for the next buckets.
          _currentBatchSize += kIncrementalBucketBatchSize;
          _createBucketStreamSubscription(_currentBatchSize);
        },
        setHeaderBucket: (_SetHeaderBucket event) {
          emit(state.copyWith(headerBucket: event.headerBucket));
        },
      );
    });

    ////////////////////////////////////////////////////
    // kick off any events
    ////////////////////////////////////////////////////
    add(const DashboardEvent.started());
  }

  Future<void> _createBucketStreamSubscription(int batchSize) async {
    // The big disadvantage here is: we fetch the entire data again which is not very efficient. We can just hope not much users will scroll up. Sadly Firebase sucks at proper pagination.
    await _bucketsStreamSubscription?.cancel();
    _bucketsStreamSubscription = _dayBucketRepository
        .watchBuckets(batchSize: batchSize)
        .listen((failureOrBuckets) {
      add(DashboardEvent.bucketsReceived(failureOrBuckets));
    });
  }

  @override
  Future<void> close() async {
    await _cleanup();
    return super.close();
  }

  Future<void> _cleanup() async {
    _currentBatchSize = kInitialBucketBatchSize;
    await _bucketsStreamSubscription?.cancel();
    await _foodInputBlocEntriesSubscription?.cancel();
    await _foodInputBlocOutgoingEntriesSubscription?.cancel();
  }

  Set<UniqueId> _extractEntryIdsFromBucketListThatAreAlsoInBetweenEntries(
      KtList<DayBucket> buckets) {
    if (state.foodInputBlocOutgoingEntries.isEmpty()) {
      return {};
    }
    final entriesBetweenIds =
        state.foodInputBlocOutgoingEntries.map((p0) => p0.id).toSet();
    final Set<UniqueId> results = {};
    for (var b in buckets.iter) {
      for (var e in b.entries.iter) {
        if (entriesBetweenIds.contains(e.id)) {
          results.add(e.id);
        }
      }
    }
    return results;
  }

  DayBucket? getBucketByIndex(int index) =>
      state.buckets.size > index ? state.buckets[index] : null;

  Future<void> _updateEntryInRepository(
      UniqueId entryId, MapFunction<FoodItemEntry> update) async {
    // only send update request to firebase if entry is still in todays bucket or in entriesBetweenBlocAndRepo
    if (_entryStillExistsInFirebaseOrBetweenBlocAndRepo(entryId)) {
      _dayBucketRepository.updateEntryFunctionalForToday(
        entryId,
        update,
      );
    }
  }

  bool _entryStillExistsInFirebaseOrBetweenBlocAndRepo(UniqueId entryId) {
    for (var e in state.foodInputBlocOutgoingEntries.iter) {
      if (e.id == entryId) {
        return true;
      }
    }
    final todayBucket = state.buckets.firstOrNull();
    if (todayBucket != null) {
      for (var e in todayBucket.entries.iter) {
        if (e.id == entryId) {
          return true;
        }
      }
    }
    return false;
  }
}

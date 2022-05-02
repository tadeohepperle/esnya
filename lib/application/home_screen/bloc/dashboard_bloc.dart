import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:esnya/application/food_data/input/food_input_bloc.dart';
import 'package:esnya/domain/user_data/food_item_entry_bucket_repository.dart';
import 'package:esnya/injection_environments.dart';
import 'package:esnya_shared_resources/core/core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:kt_dart/collection.dart';

part 'dashboard_event.dart';
part 'dashboard_state.dart';
part 'dashboard_bloc.freezed.dart';

const kInitialBucketBatchSize = 10;
const kIncrementalBucketBatchSize = 10;
const kMinMillisecondsBetweenExtendBucketWatchRange = 2000;

@isolate1
@lazySingleton
class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  final FoodItemEntryBucketRepository _foodItemEntryBucketRepository;
  final FoodInputBloc _foodInputBloc;

  StreamSubscription<Either<Failure, KtList<FoodItemEntryBucket>>>?
      _bucketsStreamSubscription;
  late int _currentBatchSize;
  late DateTime _lastExtendBucketWatchRange;
  StreamSubscription<BlocAndRepoFoodItemEntries>?
      _foodInputBlocEntriesSubscription;

  DashboardBloc(this._foodItemEntryBucketRepository, this._foodInputBloc)
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
              _foodInputBloc.watchEntries().listen((entries) {
            add(DashboardEvent.foodInputEntriesReceived(entries));
          });
        },
        bucketsReceived: (_BucketsReceived event) async {
          event.failureOrBuckets.fold(
            (Failure failure) {
              emit(state.copyWith(
                dashboardBucketsState: DashboardBucketsState.failure,
              )); // TODO: also set buckets to [] or rather keep buckets from old state?
            },
            (KtList<FoodItemEntryBucket> buckets) {
              final arrivedIds =
                  _extractEntryIdsFromBucketListThatAreAlsoInBetweenEntries(
                      buckets);
              emit(state.copyWith(
                dashboardBucketsState: DashboardBucketsState.loaded,
                buckets: buckets,
                entriesBetweenBlocAndRepo: state.entriesBetweenBlocAndRepo
                    .filter((e) => !arrivedIds.contains(e.id)),
              ));
            },
          );
        },
        foodInputEntriesReceived: (_FoodInputEntriesReceived event) async {
          emit(state.copyWith(
            entriesBetweenBlocAndRepo: state.entriesBetweenBlocAndRepo +
                event.entries.betweenBlocAndRepoEntries.toImmutableList(),
            entriesFoodInputBloc: event.entries.blocEntries.toImmutableList(),
          ));
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
    _bucketsStreamSubscription = _foodItemEntryBucketRepository
        .watchLogBuckets(batchSize: batchSize)
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
  }

  Set<UniqueId> _extractEntryIdsFromBucketListThatAreAlsoInBetweenEntries(
      KtList<FoodItemEntryBucket> buckets) {
    if (state.entriesBetweenBlocAndRepo.isEmpty()) {
      return {};
    }
    final entriesBetweenIds =
        state.entriesBetweenBlocAndRepo.map((p0) => p0.id).toSet();
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
}

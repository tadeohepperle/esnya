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

@isolate1
@injectable
class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  final FoodItemEntryBucketRepository _foodItemEntryBucketRepository;
  final FoodInputBloc _foodInputBloc;

  StreamSubscription<Either<Failure, KtList<FoodItemEntryBucket>>>?
      _bucketsStreamSubscription;
  StreamSubscription<BlocAndRepoFoodItemEntries>?
      _foodInputBlocEntriesSubscription;

  DashboardBloc(this._foodItemEntryBucketRepository, this._foodInputBloc)
      : super(DashboardState.initial()) {
    on<DashboardEvent>((event, emit) async {
      await event.map(
        started: (_Started event) async {
          // cancel subscriptions just in case.
          await _bucketsStreamSubscription?.cancel();
          await _foodInputBlocEntriesSubscription?.cancel();
          // listen to buckets from firestore
          _bucketsStreamSubscription = _foodItemEntryBucketRepository
              .watchLogBuckets()
              .listen((failureOrBuckets) {
            add(DashboardEvent.bucketsReceived(failureOrBuckets));
          });
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
      );
    });

    add(const DashboardEvent.started());
  }

  @override
  Future<void> close() async {
    await _bucketsStreamSubscription?.cancel();
    await _foodInputBlocEntriesSubscription?.cancel();
    return super.close();
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

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:esnya/domain/user_data/food_item_entry_bucket_repository.dart';
import 'package:esnya/injection_environments.dart';
import 'package:esnya_shared_resources/core/core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:kt_dart/collection.dart';

part 'food_entries_watcher_event.dart';
part 'food_entries_watcher_state.dart';
part 'food_entries_watcher_bloc.freezed.dart';

@isolate1
@injectable
class FoodEntriesWatcherBloc
    extends Bloc<FoodEntriesWatcherEvent, FoodEntriesWatcherState> {
  final FoodItemEntryBucketRepository _foodItemEntryBucketRepository;

  StreamSubscription<Either<Failure, KtList<FoodItemEntryBucket>>>?
      _foodEntriesStreamSubscription;

  FoodEntriesWatcherBloc(this._foodItemEntryBucketRepository)
      : super(FoodEntriesWatcherState.initial()) {
    on<FoodEntriesWatcherEvent>((event, emit) async {
      await event.map(watchStarted: (_Started watchStarted) async {
        emit(FoodEntriesWatcherState.loadInProgress());
        await _foodEntriesStreamSubscription?.cancel();
        _foodEntriesStreamSubscription = _foodItemEntryBucketRepository
            .watchLogBuckets()
            .listen((failureOrBuckets) {
          print(failureOrBuckets.fold((l) => l, (r) => r));
          add(FoodEntriesWatcherEvent.entriesReceived(failureOrBuckets));
        });
      }, entriesReceived: (_EntriesReceived entriesReceived) {
        emit(
          entriesReceived.failureOrFoodEntries.fold(
            (l) => FoodEntriesWatcherState.loadFailure(l),
            (r) => FoodEntriesWatcherState.loadSuccess(r),
          ),
        );
      });
    });
    add(FoodEntriesWatcherEvent.watchStarted());
  }

  @override
  Future<void> close() async {
    await _foodEntriesStreamSubscription?.cancel();
    return super.close();
  }
}

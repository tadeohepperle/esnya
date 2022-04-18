part of 'food_entries_watcher_bloc.dart';

@freezed
class FoodEntriesWatcherState with _$FoodEntriesWatcherState {
  const factory FoodEntriesWatcherState.initial() =
      FoodEntriesWatcherStateInitial;
  const factory FoodEntriesWatcherState.loadInProgress() =
      FoodEntriesWatcherStateLoadInProgress;
  const factory FoodEntriesWatcherState.loadSuccess(
      KtList<FoodItemEntryBucket> buckets) = FoodEntriesWatcherStateLoadSuccess;
  const factory FoodEntriesWatcherState.loadFailure(Failure noteFailure) =
      FoodEntriesWatcherStateLoadFailure;
}

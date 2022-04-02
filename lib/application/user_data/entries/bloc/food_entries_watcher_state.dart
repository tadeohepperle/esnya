part of 'food_entries_watcher_bloc.dart';

@freezed
class FoodEntriesWatcherState with _$FoodEntriesWatcherState {
  const factory FoodEntriesWatcherState.initial() = _Initial;
  const factory FoodEntriesWatcherState.loadInProgress() = _LoadInProgress;
  const factory FoodEntriesWatcherState.loadSuccess(List<FoodItemEntry> notes) =
      _LoadSuccess;
  const factory FoodEntriesWatcherState.loadFailure(Failure noteFailure) =
      _LoadFailure;
}

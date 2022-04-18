part of 'food_entries_watcher_bloc.dart';

@freezed
class FoodEntriesWatcherEvent with _$FoodEntriesWatcherEvent {
  const factory FoodEntriesWatcherEvent.watchStarted() = _Started;
  const factory FoodEntriesWatcherEvent.entriesReceived(
    Either<Failure, KtList<FoodItemEntryBucket>> failureOrFoodEntries,
  ) = _EntriesReceived;
}

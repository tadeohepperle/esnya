part of 'food_entries_bloc.dart';

@freezed
class FoodEntriesState with _$FoodEntriesState {
  const factory FoodEntriesState({required List<FoodItemEntry> entries}) =
      _FoodEntriesState;
  factory FoodEntriesState.initial() =>
      FoodEntriesState(entries: <FoodItemEntry>[]);
}

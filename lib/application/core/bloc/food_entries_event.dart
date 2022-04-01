part of 'food_entries_bloc.dart';

@freezed
class FoodEntriesEvent with _$FoodEntriesEvent {
  const factory FoodEntriesEvent.initial() = InitialEvent;
  const factory FoodEntriesEvent.addEntry(FoodItemEntry entry) = AddEntry;
  const factory FoodEntriesEvent.updateEntry(FoodItemEntry entry) = UpdateEntry;
}

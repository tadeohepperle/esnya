part of 'food_input_bloc.dart';

@freezed
class FoodInputEvent with _$FoodInputEvent {
  const factory FoodInputEvent.setVolatileText(String value) = _SetVolatileText;
  const factory FoodInputEvent.saveVolatileText() = _SaveVolatileText;
  const factory FoodInputEvent.fetchFood(FoodItemEntryWrapper entry) =
      _FetchFood;
}

part of 'food_input_bloc.dart';

@freezed
class FoodInputEvent with _$FoodInputEvent {
  const factory FoodInputEvent.setVolatileText(String value) = _SetVolatileText;
  const factory FoodInputEvent.saveVolatileText() = _SaveVolatileText;
  const factory FoodInputEvent.fetchFood(FoodItemEntryWrapper entry) =
      _FetchFood;

  /// concept: whenever context is not the same as before, we reset the state and blocentries
  /// example: called on every build in dashbaord tab with conextId ="dashboard": if != before, reset bloc.
  /// Called with contextId="addFoodItem#12342" in add food to collection screen.
  const factory FoodInputEvent.setContext(String contextId) = _SetContext;
  const factory FoodInputEvent.setFoodInputMode(FoodInputMode mode) =
      _SetFoodInputMode;
}

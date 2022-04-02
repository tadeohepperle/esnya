part of 'food_input_bloc.dart';

@freezed
class FoodInputEvent with _$FoodInputEvent {
  // rest entire bloc
  const factory FoodInputEvent.reset() = Reset;
  // set volatile text to any value, for example by user keyboard input or by voice input
  const factory FoodInputEvent.setVolatileText(String text) = SetVolatileText;
  // this adds the current volatile text to the safe text such that it cannot be edited anymore.
  // for example when user hits enter and therefore submitts a string finally.
  // or when a certain time has passen in Voice Recognition such that we get a full Result and not only a partial Result.
  const factory FoodInputEvent.makeVolatileTextSafe() = MakeVolatileTextSafe;
  // just calls and awaits .fragmentize() on the TextProcessingRepository. The result is subsequently handled in an ApplyFragments event. So during the processing of BuildFragments no state is altered directly.
  const factory FoodInputEvent.buildFragments() = BuildFragments;
  // constrcut FoodItemEntry Objects from the fragments and alter the state
  const factory FoodInputEvent.applyFragments(
      FragmentizationResult fragmentizationResult) = ApplyFragments;
  const factory FoodInputEvent.fetchFoodForFoodItemEntry(
      FoodItemEntry foodItemEntry) = FetchFoodForFoodItemEntry;
}

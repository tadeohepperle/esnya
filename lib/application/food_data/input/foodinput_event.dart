part of 'foodinput_bloc.dart';

@freezed
class FoodinputEvent with _$FoodinputEvent {
  // rest entire bloc
  const factory FoodinputEvent.reset() = Reset;
  // set volatile text to any value, for example by user keyboard input or by voice input
  const factory FoodinputEvent.setVolatileText(String text) = SetVolatileText;
  // this adds the current volatile text to the safe text such that it cannot be edited anymore.
  // for example when user hits enter and therefore submitts a string finally.
  // or when a certain time has passen in Voice Recognition such that we get a full Result and not only a partial Result.
  const factory FoodinputEvent.makeVolatileTextSafe() = MakeVolatileTextSafe;
  // just calls and awaits .fragmentize() on the TextProcessingRepository. The result is subsequently handled in an ApplyFragments event. So during the processing of BuildFragments no state is altered directly.
  const factory FoodinputEvent.buildFragments() = BuildFragments;
  // constrcut FoodItemEntry Objects from the fragments and alter the state
  const factory FoodinputEvent.applyFragments(
      FragmentizationResult fragmentizationResult) = ApplyFragments;
  const factory FoodinputEvent.fetchFoodForFoodItemEntry(
          FoodItemEntryPreSuccess foodItemEntryPreSuccess) =
      FetchFoodForFoodItemEntry;
}

part of 'foodinput_bloc.dart';

@freezed
class FoodinputEvent with _$FoodinputEvent {
  const factory FoodinputEvent.reset() = Reset;
  const factory FoodinputEvent.setVolatileText(String text) = SetVolatileText;
  const factory FoodinputEvent.makeVolatileTextSafe() = MakeVolatileTextSafe;
  const factory FoodinputEvent.buildFoodItemStrings() = BuildFoodItemStrings;
  const factory FoodinputEvent.applyFoodItemStrings(
      KtList<Tuple2<IntRange, FoodItemString>> items) = ApplyFoodItemStrings;
  const factory FoodinputEvent.fetchAmountAndFood(FoodItem foodItem) =
      FetchAmountAndFood;
}

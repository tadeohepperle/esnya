import 'package:esnya/domain/core/data_structures.dart';
import 'package:esnya/domain/food_data/entities/measure_unit.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'food_item_string.freezed.dart';

@freezed
abstract class FoodItemString with _$FoodItemString {
  const factory FoodItemString(
    String text, {
    IntRange? numberRange,
    IntRange? unitRange,
    IntRange? labelRange,
    required MeasureUnit unitGuess,
    required num numberGuess,
  }) = _FoodItemString;
}

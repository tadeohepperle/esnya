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
    required IntRange labelRange,
    required MeasureUnit unitGuess,
    required double numberGuess,
  }) = _FoodItemString;
}

extension FoodItemStringX on FoodItemString {
  String get label => text.substring(labelRange.start, labelRange.end);

  String shortString() {
    var s = numberGuess.toString();
    if (unitGuess.toString() != MeasureUnit.noUnit.toString()) {
      s += '_' + unitGuess.toString();
    }
    s += '_' + label;
    return s;
  }
}

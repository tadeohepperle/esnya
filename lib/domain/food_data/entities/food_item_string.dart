import 'package:esnya/domain/core/data_structures.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'food_item_string.freezed.dart';

@freezed
abstract class FoodItemString with _$FoodItemString {
  const factory FoodItemString(String text,
      {IntRange? number, IntRange? unit, IntRange? label}) = _FoodItemString;
}

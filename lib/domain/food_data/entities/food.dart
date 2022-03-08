import 'package:esnya/domain/food_data/entities/macro_nutrients.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'food.freezed.dart';

///
/// represents foods saved in database.
@freezed
abstract class Food with _$Food {
  const factory Food({
    required String id, // TODO: maybe UniqueID instead
    required String name, // TODO: replace with map for internationalization.
    required MacroNutrients nutrients, // TODO: add micronutrients
    num? kcal,
    num? density,
  }) = _Food;
}

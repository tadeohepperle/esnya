import 'package:freezed_annotation/freezed_annotation.dart';
part 'macro_nutrients.freezed.dart';

///
/// represents food items saved in database.
@freezed
class MacroNutrients with _$MacroNutrients {
  const factory MacroNutrients({
    num? carbs,
    num? sugar,
    num? fatsat,
    num? protein,
    num? fiber,
    num? water,
    num? alcohol,
    num? salt,
  }) = _MacroNutrients;
}

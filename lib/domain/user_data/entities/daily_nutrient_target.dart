import 'package:esnya_shared_resources/esnya_shared_resources.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'daily_nutrient_target.freezed.dart';
part 'daily_nutrient_target.g.dart';

@freezed
class DailyNutrientTarget with _$DailyNutrientTarget {
  const factory DailyNutrientTarget({
    @NutrientTypeConverter() required NutrientType nutrientType,
    @AmountConverter() required Amount amount,
    required DailyNutrientTargetMode mode,
  }) = _DailyNutrientTarget;

  factory DailyNutrientTarget.fromJson(Map<String, dynamic> json) =>
      _$DailyNutrientTargetFromJson(json);
}

enum DailyNutrientTargetMode {
  /// user should be encouraged to take more of this Nutrient
  good,

  /// does not matter
  neutral,

  /// user should be encouraged to take less of this Nutrient
  bad
}

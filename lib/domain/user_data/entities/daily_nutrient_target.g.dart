// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_nutrient_target.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DailyNutrientTarget _$$_DailyNutrientTargetFromJson(
        Map<String, dynamic> json) =>
    _$_DailyNutrientTarget(
      nutrientType: const NutrientTypeConverter()
          .fromJson(json['nutrientType'] as String),
      amount: const AmountConverter()
          .fromJson(json['amount'] as Map<String, dynamic>),
      mode: $enumDecode(_$DailyNutrientTargetModeEnumMap, json['mode']),
    );

Map<String, dynamic> _$$_DailyNutrientTargetToJson(
        _$_DailyNutrientTarget instance) =>
    <String, dynamic>{
      'nutrientType':
          const NutrientTypeConverter().toJson(instance.nutrientType),
      'amount': const AmountConverter().toJson(instance.amount),
      'mode': _$DailyNutrientTargetModeEnumMap[instance.mode],
    };

const _$DailyNutrientTargetModeEnumMap = {
  DailyNutrientTargetMode.good: 'good',
  DailyNutrientTargetMode.neutral: 'neutral',
  DailyNutrientTargetMode.bad: 'bad',
};

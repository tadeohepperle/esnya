import 'dart:convert';

import 'package:esnya/domain/user_data/entities/daily_nutrient_target.dart';
import 'package:esnya_shared_resources/core/core.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test(
    'should convert from and to json',
    () async {
      // arrange
      final dailyTarget = DailyNutrientTarget(
          nutrientType: NutrientType.carbs,
          amount: Amount(MeasureUnit.g, 30),
          mode: DailyNutrientTargetMode.good);
      // act
      final map = dailyTarget.toJson();
      final jsonString = jsonEncode(map);
      // assert
      expect(DailyNutrientTarget.fromJson(dailyTarget.toJson()), dailyTarget);
      expect(DailyNutrientTarget.fromJson(jsonDecode(jsonString)), dailyTarget);
    },
  );
}

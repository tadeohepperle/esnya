import 'package:esnya_shared_resources/esnya_shared_resources.dart';
import 'package:injectable/injectable.dart';

import '../../domain/user_data/entities/daily_nutrient_target.dart';
import '../../domain/user_data/user_diet_preferences_repository.dart';
import '../../injection_environments.dart';

@isolate1
@LazySingleton(as: UserDietPreferencesRepository)
class UserDietPreferencesRepositoryImpl
    implements UserDietPreferencesRepository {
  // TODO:
  @override
  NutrientType get preferredNutrientPrimary => NutrientType.energy;
  @override
  NutrientType get preferredNutrientSecondary => NutrientType.protein;

  @override
  DailyNutrientTarget getDailyTarget(NutrientType nutrientType) {
    // TODO:
    if (nutrientType == NutrientType.energy) {
      return DailyNutrientTarget(
        nutrientType: nutrientType,
        amount: Amount(MeasureUnit.kcal, 2300),
        mode: DailyNutrientTargetMode.bad,
      );
    }
    return DailyNutrientTarget(
      nutrientType: nutrientType,
      amount: Amount(MeasureUnit.g, 90),
      mode: DailyNutrientTargetMode.neutral,
    );
  }
}

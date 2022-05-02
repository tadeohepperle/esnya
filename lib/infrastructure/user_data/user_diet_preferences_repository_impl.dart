import 'package:esnya/domain/user_data/entities/daily_nutrient_target.dart';
import 'package:esnya/domain/user_data/user_diet_preferences_repository.dart';
import 'package:esnya/injection_environments.dart';
import 'package:esnya_shared_resources/esnya_shared_resources.dart';
import 'package:injectable/injectable.dart';

@isolate1
@LazySingleton(as: UserDietPreferencesRepository)
class UserDietPreferencesRepositoryImpl
    implements UserDietPreferencesRepository {
  @override
  List<NutrientType> get preferredNutrients =>
      [NutrientType.energy, NutrientType.protein];

  @override
  DailyNutrientTarget getDailyTarget(NutrientType nutrientType) {
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

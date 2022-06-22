import 'entities/daily_nutrient_target.dart';
import 'package:esnya_shared_resources/esnya_shared_resources.dart';

abstract class UserDietPreferencesRepository {
  NutrientType get preferredNutrientPrimary;
  NutrientType get preferredNutrientSecondary;
  DailyNutrientTarget getDailyTarget(NutrientType nutrientType);
}

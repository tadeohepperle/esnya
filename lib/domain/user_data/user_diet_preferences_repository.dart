import 'package:esnya/domain/user_data/entities/daily_nutrient_target.dart';
import 'package:esnya_shared_resources/esnya_shared_resources.dart';

abstract class UserDietPreferencesRepository {
  List<NutrientType> get preferredNutrients;
  DailyNutrientTarget getDailyTarget(NutrientType nutrientType);
}

import 'package:esnya_shared_resources/esnya_shared_resources.dart';

abstract class UserDietPreferencesRepository {
  List<NutrientType> get preferredNutrients;
}

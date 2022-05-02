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
}

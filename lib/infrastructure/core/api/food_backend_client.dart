import 'package:esnya_shared_resources/core/models/food.dart';
import 'package:esnya_shared_resources/food_mapping/models/food_mapping_result.dart';

import 'models/guess_food_request_body.dart';

// this is not in domain folder, because it should only be used by implementations of repositories.

/// communicates with the dart backend from this repo: https://github.com/tadeohepperle/esnya-food-backend
abstract class FoodBackendClient {
  Future<Food> getFood(String id);
  Future<FoodMappingResult> mapInput(GuessFoodRequestBody body);
}

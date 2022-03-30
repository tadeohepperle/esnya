import 'package:esnya_shared_resources/core/models/food.dart';

// this is not in domain folder, because it should only be used by implementations of repositories.

/// communicates with the dart backend from this repo: https://github.com/tadeohepperle/esnya-food-backend
abstract class FoodBackendClient {
  Future<Food> getFood(String id);
}

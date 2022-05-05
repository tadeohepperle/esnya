import 'package:dartz/dartz.dart';
import 'package:esnya/infrastructure/core/api/food_backend_client.dart';
import 'package:esnya/injection_environments.dart';
import 'package:esnya_shared_resources/esnya_shared_resources.dart';
import 'package:injectable/injectable.dart';

// @isolate2
// @LazySingleton(as: FoodDataRepository)
class FoodDataRepositoryRemoteImpl extends SetupRepositoryImpl
    implements FoodDataRepository {
  final FoodBackendClient apiClient;

  FoodDataRepositoryRemoteImpl(this.apiClient);

  @override
  Future<Either<Failure, Unit>> doSetupWork() async {
    return right(unit);
  }

  @override
  Future<Either<DataFailure, Food>> getFoodFromID(String id) async {
    try {
      final food = await apiClient.getFood(id);
      return right(food);
    } catch (ex) {
      print(ex);
      return left(DataFailure.apiFailure("GET /data/food/$id"));
    }
  }
}

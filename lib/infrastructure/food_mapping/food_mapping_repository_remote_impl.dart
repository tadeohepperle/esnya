import 'package:esnya/infrastructure/core/api/food_backend_client.dart';
import 'package:esnya/infrastructure/core/api/models/guess_food_request_body.dart';
import 'package:esnya/injection_environments.dart';
import 'package:esnya_shared_resources/core/error_handling/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:esnya_shared_resources/core/error_handling/failures.dart';
import 'package:esnya_shared_resources/core/repositories/setup_repository_impl.dart';
import 'package:esnya_shared_resources/food_mapping/models/food_mapping_result.dart';
import 'package:esnya_shared_resources/food_mapping/repositories/food_mapping_repository.dart';
import 'package:injectable/injectable.dart';

// @isolate2
// @LazySingleton(as: FoodMappingRepository)
class FoodMappingRepositoryRemoteImpl extends SetupRepositoryImpl
    implements FoodMappingRepository {
  final FoodBackendClient apiClient;

  FoodMappingRepositoryRemoteImpl(this.apiClient);

  @override
  Future<Either<Failure, Unit>> doSetupWork() async {
    return right(unit);
  }

  @override
  Future<Either<Failure, FoodMappingResult>> mapInput(String input) async {
    try {
      final foodMappingResult =
          await apiClient.mapInput(GuessFoodRequestBody(input));
      return right(foodMappingResult);
    } catch (ex) {
      print(ex);
      return left(DataFailure.apiFailure(
          'POST /guess/food with body {"input": $input}'));
    }
  }
}

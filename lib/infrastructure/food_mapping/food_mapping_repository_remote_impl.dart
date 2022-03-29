import 'package:esnya_shared_resources/core/error_handling/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:esnya_shared_resources/core/repositories/setup_repository_impl.dart';
import 'package:esnya_shared_resources/food_mapping/models/food_mapping_result.dart';
import 'package:esnya_shared_resources/food_mapping/repositories/food_mapping_repository.dart';

class FoodMappingRepositoryRemoteImpl extends SetupRepositoryImpl
    implements FoodMappingRepository {
  @override
  Future<Either<Failure, Unit>> doSetupWork() {
    // TODO: implement doSetupWork
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, FoodMappingResult>> mapInput(String input) {
    // TODO: implement mapInput
    throw UnimplementedError();
  }
}

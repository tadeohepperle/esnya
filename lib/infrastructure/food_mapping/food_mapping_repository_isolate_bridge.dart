import 'package:esnya/domain/isolate2/entities/isolate_request.dart';
import 'package:esnya/domain/isolate2/isolate_2_repository.dart';
import 'package:esnya/injection_environments.dart';
import 'package:esnya_shared_resources/core/error_handling/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:esnya_shared_resources/core/repositories/setup_repository_impl.dart';
import 'package:esnya_shared_resources/food_mapping/models/food_mapping_result.dart';
import 'package:esnya_shared_resources/food_mapping/repositories/food_mapping_repository.dart';
import 'package:injectable/injectable.dart';

@isolate1
@LazySingleton(as: FoodMappingRepository)
class FoodMappingRepositoryIsolateBridge extends SetupRepositoryImpl
    implements FoodMappingRepository {
  final Isolate2Repository isolate2repository;

  FoodMappingRepositoryIsolateBridge(this.isolate2repository);

  @override
  Stream<Either<Failure, double>> doSetupWork() async* {
    yield right(1);
  }

  @override
  Future<Either<Failure, FoodMappingResult>> mapInput(String input) async {
    final res = await isolate2repository
        .makeRequest<Either<Failure, FoodMappingResult>>(
            IsolateRequest.foodMappingRepositoryMapInput(input));
    return res;
  }
}

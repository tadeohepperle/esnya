import '../../domain/isolate2/entities/isolate_request.dart';
import '../../domain/isolate2/isolate_2_repository.dart';
import '../../injection.dart';
import '../../injection_environments.dart';
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
  final Isolate2Repository isolate2Repository;

  FoodMappingRepositoryIsolateBridge(this.isolate2Repository);

  @override
  Stream<Either<Failure, double>> doSetupWork() async* {
    yield right(0);
    // sadly the progress streaming is lost, as we cannot get continous streams from isolate 2 as of now
    final failureOrUnit = await isolate2Repository
        .makeRequest(IsolateRequestFoodMappingRepositorySetup());
    yield failureOrUnit.fold((l) => left(l), (r) => right(1));
  }

  @override
  Future<Either<Failure, FoodMappingResult>> mapInput(String input) async {
    // await Future.delayed(Duration(milliseconds: 2000));
    final res = await isolate2Repository
        .makeRequest<Either<Failure, FoodMappingResult>>(
            IsolateRequest.foodMappingRepositoryMapInput(input));
    return res;
  }
}

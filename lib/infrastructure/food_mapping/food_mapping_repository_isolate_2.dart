import 'package:dartz/dartz.dart';
import 'package:esnya/domain/resources/resource_repository.dart';
import 'package:esnya/infrastructure/food_mapping/food_mapping_repository_local_impl_csv.dart';
import 'package:esnya/infrastructure/food_mapping/food_mapping_repository_remote_impl.dart';
import 'package:esnya/infrastructure/resources/food_data_resource.dart';
import 'package:esnya/injection_environments.dart';
import 'package:esnya_shared_resources/esnya_shared_resources.dart';
import 'package:injectable/injectable.dart';

@isolate2
@LazySingleton(as: FoodMappingRepository)
class FoodMappingRepositoryIsolate2 extends SetupRepositoryImpl
    implements FoodMappingRepository {
  final ResourceRepository resourceRepository;
  final FoodMappingRepositoryLocalImplCsv foodMappingRepositoryLocalImplCsv;
  final FoodMappingRepositoryRemoteImpl foodMappingRepositoryRemoteImpl;
  FoodMappingRepositoryIsolate2(
    this.resourceRepository,
    this.foodMappingRepositoryLocalImplCsv,
    this.foodMappingRepositoryRemoteImpl,
  );

  @override
  Future<Either<Failure, Unit>> doSetupWork() async {
    return right(unit);
  }

  @override
  Future<Either<Failure, FoodMappingResult>> mapInput(String input) {
    final foodDataResourceStatus =
        resourceRepository.resourceStatus<FoodDataResource>();

    return Future.delayed(Duration(milliseconds: 1500))
        .then((value) => foodMappingRepositoryRemoteImpl.mapInput(input));
    // TODO: CHANGE BACK!!!
    return foodDataResourceStatus.maybeMap(
      available: (_) => foodMappingRepositoryLocalImplCsv.mapInput(input),
      orElse: () => foodMappingRepositoryRemoteImpl.mapInput(input),
    );
  }
}

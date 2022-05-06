import 'package:dartz/dartz.dart';
import 'package:esnya/domain/resources/resource_repository.dart';
import 'package:esnya/infrastructure/food_data/food_data_repository_local_impl_csv.dart';
import 'package:esnya/infrastructure/food_data/food_data_repository_remote_impl.dart';
import 'package:esnya/infrastructure/resources/food_data_resource.dart';
import 'package:esnya/injection_environments.dart';
import 'package:esnya_shared_resources/esnya_shared_resources.dart';
import 'package:injectable/injectable.dart';

@isolate2
@LazySingleton(as: FoodDataRepository)
class FoodDataRepositoryIsolate2 extends SetupRepositoryImpl
    implements FoodDataRepository {
  final ResourceRepository resourceRepository;
  final FoodDataRepositoryLocalImplCsv foodDataRepositoryLocalImplCsv;
  final FoodDataRepositoryRemoteImpl foodDataRepositoryRemoteImpl;

  FoodDataRepositoryIsolate2(
    this.resourceRepository,
    this.foodDataRepositoryLocalImplCsv,
    this.foodDataRepositoryRemoteImpl,
  );

  @override
  Future<Either<Failure, Unit>> doSetupWork() async {
    return right(unit);
  }

  @override
  Future<Either<DataFailure, Food>> getFoodFromID(String id) {
    final foodDataResourceStatus =
        resourceRepository.resourceStatus<FoodDataResource>();
    return foodDataResourceStatus.maybeMap(
      available: (a) => foodDataRepositoryLocalImplCsv.getFoodFromID(id),
      orElse: () => foodDataRepositoryLocalImplCsv.getFoodFromID(id),
    );
  }
}

import 'package:dartz/dartz.dart';
import 'package:esnya/infrastructure/food_mapping/food_mapping_repository_local_impl_csv.dart';
import 'package:esnya/injection_environments.dart';
import 'package:esnya_shared_resources/esnya_shared_resources.dart';
import 'package:injectable/injectable.dart';

@isolate2
@LazySingleton(as: FoodMappingRepository)
class FoodMappingRepositoryIsolate2 extends SetupRepositoryImpl
    implements FoodMappingRepository {
  final FoodMappingRepositoryLocalImplCsv foodMappingRepositoryLocalImplCsv;
  FoodMappingRepositoryIsolate2(
    this.foodMappingRepositoryLocalImplCsv,
  );

  @override
  Future<Either<Failure, Unit>> doSetupWork() async {
    return right(unit);
  }

  @override
  Future<Either<Failure, FoodMappingResult>> mapInput(String input) {
    /// TODO: currently we just delegate to ImplCsv, in future failures could lead to remote requests or something.
    return foodMappingRepositoryLocalImplCsv.mapInput(input);
  }
}

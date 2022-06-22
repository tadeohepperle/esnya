import 'package:dartz/dartz.dart';
import 'food_mapping_repository_local_impl_csv.dart';
import '../../injection_environments.dart';
import 'package:esnya_shared_resources/esnya_shared_resources.dart';
import 'package:injectable/injectable.dart';

/// TODO: currently we just delegate to ImplCsv, in future failures could lead to remote requests or something.
@isolate2
@LazySingleton(as: FoodMappingRepository)
class FoodMappingRepositoryIsolate2 extends SetupRepositoryImpl
    implements FoodMappingRepository {
  final FoodMappingRepositoryLocalImplCsv foodMappingRepositoryLocalImplCsv;
  FoodMappingRepositoryIsolate2(
    this.foodMappingRepositoryLocalImplCsv,
  );

  @override
  Stream<Either<Failure, double>> doSetupWork() async* {
    yield* foodMappingRepositoryLocalImplCsv.doSetupWork();
  }

  @override
  Future<Either<Failure, FoodMappingResult>> mapInput(String input) {
    return foodMappingRepositoryLocalImplCsv.mapInput(input);
  }
}

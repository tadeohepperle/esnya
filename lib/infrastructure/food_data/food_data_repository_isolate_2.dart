import 'package:dartz/dartz.dart';
import 'package:esnya/infrastructure/food_data/food_data_repository_local_impl_csv.dart';
import 'package:esnya/injection_environments.dart';
import 'package:esnya_shared_resources/esnya_shared_resources.dart';
import 'package:injectable/injectable.dart';

@isolate2
@LazySingleton(as: FoodDataRepository)
class FoodDataRepositoryIsolate2 extends SetupRepositoryImpl
    implements FoodDataRepository {
  final FoodDataRepositoryLocalImplCsv foodDataRepositoryLocalImplCsv;

  FoodDataRepositoryIsolate2(
    this.foodDataRepositoryLocalImplCsv,
  );

  @override
  Future<Either<Failure, Unit>> doSetupWork() async {
    return right(unit);
  }

  @override
  Future<Either<DataFailure, Food>> getFoodFromID(String id) {
    /// TODO: currently we just delegate to ImplCsv, in future failures could lead to remote requests or something.
    return foodDataRepositoryLocalImplCsv.getFoodFromID(id);
  }
}

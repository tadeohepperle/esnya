import 'package:dartz/dartz.dart';
import 'package:esnya_shared_resources/esnya_shared_resources.dart';
import 'package:injectable/injectable.dart';

import '../../injection_environments.dart';
import 'food_data_repository_local_impl_csv.dart';

/// TODO: currently we just delegate to ImplCsv, in future failures could lead to remote requests or something.
@isolate2
@LazySingleton(as: FoodDataRepository)
class FoodDataRepositoryIsolate2 extends SetupRepositoryImpl
    implements FoodDataRepository {
  final FoodDataRepositoryLocalImplCsv foodDataRepositoryLocalImplCsv;

  FoodDataRepositoryIsolate2(
    this.foodDataRepositoryLocalImplCsv,
  );

  @override
  Stream<Either<Failure, double>> doSetupWork() async* {
    yield* foodDataRepositoryLocalImplCsv.doSetupWork();
  }

  @override
  Future<Either<DataFailure, Food>> getFoodFromID(String id) {
    return foodDataRepositoryLocalImplCsv.getFoodFromID(id);
  }
}

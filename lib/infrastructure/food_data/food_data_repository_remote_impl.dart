import 'package:dartz/dartz.dart';
import 'package:esnya/injection_environments.dart';
import 'package:esnya_shared_resources/esnya_shared_resources.dart';
import 'package:injectable/injectable.dart';
import 'package:kt_dart/collection.dart';

@isolate2
@LazySingleton(as: FoodDataRepository)
class FoodDataRepositoryRemoteImpl extends SetupRepositoryImpl
    implements FoodDataRepository {
  @override
  Future<Either<Failure, Unit>> doSetupWork() async {
    return right(unit);
  }

  @override
  Future<Either<DataFailure, Food>> getFoodFromID(String id) async {
    // TODO: implement data source
    return right(Food(
        id: id,
        title: "blalblalblalblal",
        category: FoodCategory.beverage,
        nutrients: {},
        portions: <Portion>[].toImmutableList()));
  }
}

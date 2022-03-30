import 'package:dartz/dartz.dart';
import 'package:esnya/domain/isolate2/entities/isolate_request.dart';
import 'package:esnya/domain/isolate2/isolate_2_repository.dart';
import 'package:esnya/injection_environments.dart';
import 'package:esnya_shared_resources/esnya_shared_resources.dart';
import 'package:injectable/injectable.dart';

@isolate1
@LazySingleton(as: FoodDataRepository)
class FoodDataRepositoryIsolateBridge extends SetupRepositoryImpl
    implements FoodDataRepository {
  final Isolate2Repository isolate2repository;

  FoodDataRepositoryIsolateBridge(this.isolate2repository);

  @override
  Future<Either<Failure, Unit>> doSetupWork() async {
    return right(unit);
  }

  @override
  Future<Either<DataFailure, Food>> getFoodFromID(String id) async {
    final res = await isolate2repository.makeRequest<Either<DataFailure, Food>>(
        IsolateRequest.foodDataRepositoryGetFoodFromID(id));
    return res;
  }
}

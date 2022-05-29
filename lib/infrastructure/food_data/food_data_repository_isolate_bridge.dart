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
  final Isolate2Repository isolate2Repository;

  FoodDataRepositoryIsolateBridge(this.isolate2Repository);

  @override
  Stream<Either<Failure, double>> doSetupWork() async* {
    yield right(0);
    // sadly the progress streaming is lost, as we cannot get continous streams from isolate 2 as of now
    final failureOrUnit = await isolate2Repository
        .makeRequest(IsolateRequestFoodDataRepositorySetup());
    yield failureOrUnit.fold((l) => left(l), (r) => right(1));
  }

  @override
  Future<Either<DataFailure, Food>> getFoodFromID(String id) async {
    final res = await isolate2Repository.makeRequest<Either<DataFailure, Food>>(
        IsolateRequest.foodDataRepositoryGetFoodFromID(id));
    return res;
  }
}

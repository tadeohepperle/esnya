import 'package:dartz/dartz.dart';
import 'package:esnya/domain/resources/esnya_resources.dart';
import 'package:esnya/domain/resources/resource_repository.dart';
import 'package:esnya/infrastructure/resources/food_data_resource.dart';
import 'package:esnya/injection_environments.dart';
import 'package:esnya_shared_resources/core/core.dart';
import 'package:injectable/injectable.dart';

@isolate2
@isolate1 // TODO: is this correct isolate? in both isoaltes can lead to problems
@LazySingleton(as: ResourceRepository)
class ResourceRepositoryImpl extends SetupRepositoryImpl
    implements ResourceRepository {
  final EsnyaResources _resources = EsnyaResources();
  @override
  T getResource<T extends EsnyaResource>() {
    for (var r in _resources.resources) {
      if (r is T) return r;
    }
    throw Exception("Type $T not in EsnyaResources.resources");
  }

  @override
  Future<Either<Failure, Unit>> doSetupWork() async {
    return right(unit);
  }

  @override
  Future<void> attemptUpdates() async {
    getResource<FoodDataResource>().attemptUpdate();
  }
}

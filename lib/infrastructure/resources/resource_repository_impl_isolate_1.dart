import 'package:dartz/dartz.dart';
import 'package:esnya/domain/isolate2/entities/isolate_request.dart';
import 'package:esnya/domain/isolate2/isolate_2_repository.dart';
import 'package:esnya/domain/resources/esnya_resources.dart';
import 'package:esnya/domain/resources/resource_repository.dart';
import 'package:esnya/domain/resources/resource_status.dart';
import 'package:esnya/infrastructure/resources/food_data_resource.dart';
import 'package:esnya/infrastructure/resources/stt_model_resource.dart';
import 'package:esnya/injection_environments.dart';
import 'package:esnya_shared_resources/core/core.dart';
import 'package:injectable/injectable.dart';
import 'package:loggy/loggy.dart';

// TODO: is this correct isolate? in both isoaltes can lead to problems
@isolate1
@LazySingleton(as: ResourceRepository)
class ResourceRepositoryImplIsolate1 extends SetupRepositoryImpl
    implements ResourceRepository {
  final Isolate2Repository isolate2repository;
  final EsnyaResources _resources = EsnyaResources();

  ResourceRepositoryImplIsolate1(this.isolate2repository);

  T _getResource<T extends EsnyaResource>() {
    for (var r in _resources.resources) {
      if (r is T) return r;
    }
    throw Exception("Type $T not in EsnyaResources.resources");
  }

  @override
  ResourceStatus resourceStatus<T extends EsnyaResource>() {
    return _getResource<T>().status;
  }

  @override
  Stream<ResourceStatus> resourceStatusStream<T extends EsnyaResource>() {
    return _getResource<T>().statusStream;
  }

  @override
  Future<Either<Failure, Unit>> doSetupWork() async {
    for (var r in [
      _getResource<FoodDataResource>(),
      _getResource<SttModelResource>()
    ]) {
      r.statusStream.listen((status) {
        isolate2repository.makeRequest(
          IsolateRequest.resourceStatusChanged(r.resourceId, status),
        );
      });
    }
    // TODO: 1234 put in for voice resource.
    return right(unit);
  }

  @override
  // not triggered in doSetupWork directly, will be called somewhere else in startup process of app.
  Future<void> attemptUpdates() async {
    logInfo('called ResourceRepositoryImplIsolate1.attemptUpdates()');
    _getResource<FoodDataResource>().attemptUpdate();
    _getResource<SttModelResource>().attemptUpdate();
  }
}

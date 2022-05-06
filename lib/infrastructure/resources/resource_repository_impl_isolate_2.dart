import 'package:dartz/dartz.dart';
import 'package:esnya/domain/isolate2/entities/isolate_request.dart';
import 'package:esnya/domain/resources/esnya_resources.dart';
import 'package:esnya/domain/resources/resource_repository.dart';
import 'package:esnya/domain/resources/resource_status.dart';
import 'package:esnya/infrastructure/food_data/food_data_repository_local_impl_csv.dart';
import 'package:esnya/infrastructure/food_mapping/food_mapping_repository_local_impl_csv.dart';
import 'package:esnya/infrastructure/resources/food_data_resource.dart';
import 'package:esnya/injection_environments.dart';
import 'package:esnya_shared_resources/core/core.dart';
import 'package:injectable/injectable.dart';

import '../../injection.dart';

/// Attention: The status of any resource should not be manipulated by isolate 2, just by isolate 1.
/// Whenever the status of a resource in isolate 1 changes, the new status is copied over
/// to isolate2 and notifies all listeners there.
@isolate2
@LazySingleton(as: ResourceRepository)
class ResourceRepositoryImplIsolate2 extends SetupRepositoryImpl
    implements ResourceRepository {
  final EsnyaResources _resources = EsnyaResources();

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

  bool _reloadRequired = false;
  @override
  Future<Either<Failure, Unit>> doSetupWork() async {
    await _loadFoodDataIntoRepos();
    _getResource<FoodDataResource>().statusStream.listen((event) {
      if (event is InProgress) {
        _reloadRequired = true;
      } else if (event is Available && _reloadRequired) {
        _loadFoodDataIntoRepos();
        _reloadRequired = false;
      }
    });
    return right(unit);
  }

  Future<void> _loadFoodDataIntoRepos() async {
    Future.wait([
      getIt<FoodMappingRepositoryLocalImplCsv>().setup(),
      getIt<FoodDataRepositoryLocalImplCsv>().setup(),
    ]);
  }

  @override
  Future<void> attemptUpdates() async {
    throw Exception("this should only be called from the main isolate");
  }

  /// triggered when isolate 1 resource repository sends a request, because the status of some resource changed in isolate 1.
  void processIsolateRequest(
      IsolateRequestResourceStatusChanged isolateRequest) {
    final res = _resources.resources.firstWhere(
        (element) => element.resourceId == isolateRequest.resourceId);
    res.status = isolateRequest.newStatus;
  }
}

import 'package:injectable/injectable.dart';

import '../../domain/isolate2/entities/isolate_request.dart';
import '../../domain/isolate2/isolate_2_repository.dart';
import '../../domain/resources/esnya_resource.dart';
import '../../domain/resources/resource_repository.dart';
import '../../injection_environments.dart';

/// any updates to resources from ResourceRepositoryImplIsolate1 are sent
/// to the isolate 2, and reflected in ResourceRepositoryImplIsolate2 there.
/// The opposite direction is not synchronized, so there should not be
/// any changes made to the status of resources in isolate 2 except for
/// those that just mirror isolate 1

@isolate1
@LazySingleton(as: ResourceRepository)
class ResourceRepositoryImplIsolate1 implements ResourceRepository {
  final Isolate2Repository isolate2Repository;
  late final Map<EsnyaResourceId, EsnyaResource> _resources;

  ResourceRepositoryImplIsolate1(this.isolate2Repository) {
    _resources = {
      _foodData.resourceId: _foodData,
      _foodMappingData.resourceId: _foodMappingData,
      _voskModel.resourceId: _voskModel,
    };
    for (var r in _resources.values) {
      r.status.stream.listen((newStatus) {
        isolate2Repository.makeRequest(
          IsolateRequest.resourceStatusChanged(r.resourceId, newStatus),
        );
      });
    }
  }

  final EsnyaResource _foodData = EsnyaResource(EsnyaResourceId.foodData);
  @override
  EsnyaResource get foodData => _foodData;

  final EsnyaResource _foodMappingData =
      EsnyaResource(EsnyaResourceId.foodMappingData);
  @override
  EsnyaResource get foodMappingData => _foodMappingData;

  final EsnyaResource _voskModel = EsnyaResource(EsnyaResourceId.voskModel);
  @override
  EsnyaResource get voskModel => _voskModel;
}

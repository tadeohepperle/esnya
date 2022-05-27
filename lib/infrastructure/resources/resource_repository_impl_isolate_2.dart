import 'package:esnya/domain/resources/esnya_resource.dart';
import 'package:esnya/domain/resources/esnya_resource_status.dart';
import 'package:esnya/domain/resources/resource_repository.dart';
import 'package:esnya/injection_environments.dart';
import 'package:injectable/injectable.dart';

/// any updates to resources are only made in isolate 1 and are sent via
/// isolatechannel (isolate2repository) to isolate 2 to be mirrored there.

@isolate2
@LazySingleton(as: ResourceRepository)
class ResourceRepositoryImplIsolate2 implements ResourceRepository {
  late final Map<EsnyaResourceId, EsnyaResource> _resources;
  ResourceRepositoryImplIsolate2() {
    _resources = {
      _foodData.resourceId: _foodData,
      _foodMappingData.resourceId: _foodMappingData,
      _voskModel.resourceId: _voskModel,
    };
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

  onReceiveResourceUpdateFromIsolate1(
      EsnyaResourceId resourceId, EsnyaResourceStatus newStatus) {
    _resources[resourceId]!.status = newStatus;
  }
}

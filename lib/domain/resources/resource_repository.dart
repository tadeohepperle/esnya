import 'package:esnya/domain/resources/esnya_resources.dart';
import 'package:esnya/domain/resources/resource_status.dart';
import 'package:esnya_shared_resources/core/core.dart';

abstract class ResourceRepository implements SetupRepository {
  ResourceStatus resourceStatus<T extends EsnyaResource>();
  Stream<ResourceStatus> resourceStatusStream<T extends EsnyaResource>();

  Future<void> attemptUpdates();
}

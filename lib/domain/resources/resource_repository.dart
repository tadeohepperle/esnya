import 'package:esnya/domain/resources/esnya_resources.dart';
import 'package:esnya/domain/resources/resource_request_event.dart';
import 'package:esnya_shared_resources/core/core.dart';

abstract class ResourceRepository implements SetupRepository {
  T getResource<T extends EsnyaResource>();

  Future<void> attemptUpdates();
}

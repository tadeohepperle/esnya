import 'package:esnya/domain/resources/esnya_resources.dart';
import 'package:esnya/domain/resources/resource_request_event.dart';

abstract class ResourceRepository {
  T getResource<T extends EsnyaResource>();
}

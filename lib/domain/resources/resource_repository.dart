import 'package:esnya/domain/resources/esnya_resource.dart';

abstract class ResourceRepository {
  EsnyaResource get foodData;
  EsnyaResource get foodMappingData;
  EsnyaResource get voskModel;
}

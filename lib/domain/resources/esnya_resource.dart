import 'package:esnya_shared_resources/core/data_structures/streamable_value.dart';

import 'esnya_resource_status.dart';

class EsnyaResource {
  final EsnyaResourceId resourceId;
  final StreamableValue<EsnyaResourceStatus> status =
      StreamableValue(const EsnyaResourceStatus.unknown());
  EsnyaResource(this.resourceId);
}

enum EsnyaResourceId { foodData, foodMappingData, voskModel }

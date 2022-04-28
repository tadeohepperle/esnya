import 'dart:async';

import 'package:esnya/domain/resources/resource_request_event.dart';
import 'package:esnya/infrastructure/resources/food_data_resource.dart';

class EsnyaResources {
  final FoodDataResource foodDataResource = FoodDataResource();

  List<EsnyaResource> get resources => [foodDataResource];
}

/// a resource that needs to be setup locally, for example downloaded
abstract class EsnyaResource {
  /// local path to the resource, could be a file or folder path. folder path can then lead to multiple files. How they are handled is up to the clients.
  String get path;

  /// in Progress, failed or available
  ResourceRequestStatus get status;
  Stream<ResourceRequestStatus> get statusStream;

  /// attemptUpdate() returns same stream as watchStatus() but it performs a check for updates, does disk work and other additional work.
  Stream<ResourceRequestStatus> attemptUpdate();

  /// computes local checksums or checks existance of files to see if the resource is available.
  Future<bool> checkAvailability();
}

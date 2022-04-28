import 'dart:async';

import 'package:esnya/constants.dart';
import 'package:esnya/domain/resources/resource_request_event.dart';

class EsnyaResources {
  FoodDataResource foodDataResource = FoodDataResource();
}

/// a resource that needs to be setup locally, for example downloaded
abstract class EsnyaResource {
  /// local path to the resource, could be a file or folder path. folder path can then lead to multiple files. How they are handled is up to the clients.
  String get path;
  ResourceRequestStatus get status;
  Stream<ResourceRequestStatus> get statusStream;
  // attemptUpdate() returns same stream as watchStatus() but it performs a check for updates, does disk work and other additional work.
  Stream<ResourceRequestStatus> attemptUpdate();
  Future<bool> checkAvailability();
}

/// fm.csv and f.csv, fetched from server and stored on disk.
class FoodDataResource implements EsnyaResource {
  static const _foodCsvUrl = kEsnyaBackendAPIbaseURL + 'static/files/f.csv';
  static const _foodMappingCsvUrl =
      kEsnyaBackendAPIbaseURL + 'static/files/fm.csv';

  ResourceRequestStatus _status = ResourceRequestStatus.unknown();
  final StreamController<ResourceRequestStatus> _streamController =
      StreamController<ResourceRequestStatus>.broadcast();

  FoodDataResource() {
    _streamController.onListen = () {
      _streamController.add(_status);
    };
  }

  @override
  Stream<ResourceRequestStatus> attemptUpdate() {
    // TODO: implement attemptUpdate
    throw UnimplementedError();
  }

  @override
  Future<bool> checkAvailability() {
    // TODO: implement checkAvailability
    throw UnimplementedError();
  }

  @override
  String get path => throw UnimplementedError();

  @override
  ResourceRequestStatus get status => _status;
  set status(value) {
    _status = value;
    _streamController.add(_status);
  }

  @override
  Stream<ResourceRequestStatus> get statusStream => _streamController.stream;
}

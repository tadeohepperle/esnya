import 'dart:async';

import 'package:esnya/domain/resources/resource_repository.dart';

import 'esnya_resource_status.dart';

class EsnyaResource {
  final EsnyaResourceId resourceId;

  EsnyaResource(this.resourceId) {
    _streamController.onListen = () {
      _streamController.add(_status);
    };
  }

  final StreamController<EsnyaResourceStatus> _streamController =
      StreamController<EsnyaResourceStatus>.broadcast();
  EsnyaResourceStatus _status = const EsnyaResourceStatus.unknown();

  /// unknown, progress, failed, available
  EsnyaResourceStatus get status => _status;

  set status(EsnyaResourceStatus value) {
    _status = value;
    _streamController.add(_status);
  }

  Stream<EsnyaResourceStatus> get statusStream => _streamController.stream;
}

enum EsnyaResourceId { foodData, foodMappingData, voskModel }

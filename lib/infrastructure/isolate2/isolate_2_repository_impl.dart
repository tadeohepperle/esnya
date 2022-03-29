import 'dart:async';
import 'dart:isolate';

import 'package:dartz/dartz.dart';
import 'package:esnya/domain/core/failures.dart';
import 'package:esnya/domain/isolate2/isolate_2_repository.dart';

import 'package:esnya/infrastructure/isolate2/run_isolate_2.dart';
import 'package:esnya_shared_resources/core/core.dart';
import 'package:injectable/injectable.dart';
import 'package:stream_channel/isolate_channel.dart';

import '../../domain/isolate2/entities/isolate_request.dart';
import '../../domain/isolate2/entities/isolate_response.dart';

@LazySingleton(as: Isolate2Repository)
class Isolate2RepositoryImpl extends SetupRepositoryImpl
    implements Isolate2Repository {
  late IsolateChannel _channel;

  final Map<IsolateRequest, Completer> openRequests = {};
  Isolate? isolate;

  @override
  Future<R> makeRequest<R>(IsolateRequest request) async {
    final completer = Completer();
    openRequests[request] = completer;
    _sendOnChannel(request);
    return await completer.future as R;
  }

  @override
  Future<Either<Failure, Unit>> doSetupWork() async {
    ReceivePort receivePort = ReceivePort();
    _channel = IsolateChannel.connectReceive(receivePort);
    _channel.stream.listen((data) {
      _onReceiveOnChannel(data as IsolateResponse);
    });
    try {
      isolate = await Isolate.spawn(runIsolate2, receivePort.sendPort);
      return right(unit);
    } catch (ex) {
      print(ex);
      return left(const SetupFailue.isolateSpawnFailed());
    }
  }

  _onReceiveOnChannel(IsolateResponse response) {
    if (openRequests[response.request] != null) {
      openRequests[response.request]!.complete(response.payload);
    }
  }

  void _sendOnChannel(IsolateRequest request) {
    _channel.sink.add(request);
  }
}

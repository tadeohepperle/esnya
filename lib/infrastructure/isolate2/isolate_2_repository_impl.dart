import 'dart:async';
import 'dart:isolate';

import 'package:dartz/dartz.dart';
import '../../domain/isolate2/isolate_2_repository.dart';
import '../../domain/resources/data_directory_path_provider.dart';

import 'isolate_2_main.dart';
import 'isolate_2_spawn_arguments.dart';
import 'package:esnya_shared_resources/core/core.dart';
import 'package:injectable/injectable.dart';
import 'package:loggy/loggy.dart';
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
  Stream<Either<Failure, double>> doSetupWork() async* {
    yield right(0);
    final dataDirectoryPath = DataDirectoryPathProvider.dataDirectoryPath;

    ReceivePort receivePort = ReceivePort();
    _channel = IsolateChannel.connectReceive(receivePort);
    _channel.stream.listen((data) {
      _onReceiveOnChannel(data as IsolateResponse);
    });
    try {
      isolate = await Isolate.spawn(
        isolate2Main,
        Isolate2SpawnArguments(
          sPort: receivePort.sendPort,
          dataDirectoryPath: dataDirectoryPath,
        ),
      );
      yield right(1);
    } catch (ex) {
      logError(ex);
      yield left(SetupFailure.unexpected(runtimeType.toString()));
    }
  }

  _onReceiveOnChannel(IsolateResponse response) {
    if (openRequests[response.request] != null) {
      openRequests[response.request]!.complete(response.payload);
      openRequests.remove(response.request);
    }
  }

  void _sendOnChannel(IsolateRequest request) {
    _channel.sink.add(request);
  }
}

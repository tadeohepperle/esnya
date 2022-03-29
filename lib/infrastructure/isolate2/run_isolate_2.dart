import 'dart:isolate';

import 'package:esnya/domain/isolate2/entities/isolate_response.dart';
import 'package:stream_channel/isolate_channel.dart';

import '../../domain/isolate2/entities/isolate_request.dart';

void runIsolate2(SendPort sPort) {
  print("new isolate created");
  /////////////////////////////////
  // dependency injection
  /////////////////////////////////

  /////////////////////////////////
  // dependency injection
  /////////////////////////////////
  IsolateChannel channel = IsolateChannel.connectSend(sPort);
  channel.stream.listen((data) async {
    final request = data as IsolateRequest;
    final response = await makeRequest(request);
  });
}

Future<IsolateResponse> makeRequest(IsolateRequest request) async {
  await Future.delayed(Duration(seconds: 1));
  return IsolateResponse(
      request: request, payload: ">>>>>> This is a good return!!! <<<<<<");
}

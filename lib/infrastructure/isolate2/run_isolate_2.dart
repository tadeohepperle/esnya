import 'dart:isolate';

import 'package:esnya/domain/isolate2/entities/isolate_response.dart';
import 'package:esnya/injection.dart';
import 'package:injectable/injectable.dart';
import 'package:stream_channel/isolate_channel.dart';

import '../../domain/isolate2/entities/isolate_request.dart';

void runIsolate2(SendPort sPort) {
  print("new isolate created");
  /////////////////////////////////
  // dependency injection
  /////////////////////////////////

  configureInjection(Environment.dev);

  /////////////////////////////////
  // dependency injection
  /////////////////////////////////
  IsolateChannel channel = IsolateChannel.connectSend(sPort);
  channel.stream.listen((data) async {
    print("request comes in");
    final request = data as IsolateRequest;
    final response = await makeRequest(request);
    channel.sink.add(response);
  });
}

Future<IsolateResponse> makeRequest(IsolateRequest request) async {
  var payload = "no successful mapping";
  if (request is IsolateRequestHelloWorld) {
    await Future.delayed(Duration(seconds: 1));
    payload = "Hello World " + request.message;
  }
  return IsolateResponse(request: request, payload: payload);
}

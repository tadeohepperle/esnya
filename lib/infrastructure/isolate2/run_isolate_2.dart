import 'dart:async';
import 'dart:isolate';

import 'package:dartz/dartz.dart';
import 'package:esnya/domain/isolate2/entities/isolate_response.dart';
import 'package:esnya/injection.dart';
import 'package:esnya/injection_environments.dart';
import 'package:esnya_shared_resources/esnya_shared_resources.dart';
import 'package:injectable/injectable.dart';
import 'package:stream_channel/isolate_channel.dart';

import '../../domain/isolate2/entities/isolate_request.dart';

void runIsolate2(SendPort sPort) {
  print("isolate 2 created");
  /////////////////////////////////
  // dependency injection and setup
  /////////////////////////////////

  configureInjection(isolate2.name);
  unawaited(setupRepositories());
  // do not await because we want to create channel and get app started as soon as possible.

  /////////////////////////////////
  // dependency injection
  /////////////////////////////////
  IsolateChannel channel = IsolateChannel.connectSend(sPort);
  channel.stream.listen((data) async {
    final request = data as IsolateRequest;
    final response = await makeRequest(request);
    channel.sink.add(response);
  });
}

Future<void> setupRepositories() async {
  await getIt<FoodDataRepository>().setup();
  await getIt<FoodMappingRepository>().setup();
}

Future<IsolateResponse> makeRequest(IsolateRequest request) async {
  // map the request to the respective repository handling it.
  IsolateResponse response(dynamic payload) =>
      IsolateResponse(request: request, payload: payload);
  if (request is IsolateRequestHelloWorld) {
    await Future.delayed(const Duration(seconds: 1));
    return response("Hello World " + request.message);
  } else if (request is IsolateRequestFoodDataRepositoryGetFoodFromID) {
    Either<DataFailure, Food> foodOrFailure =
        await getIt<FoodDataRepository>().getFoodFromID(request.id);

    return response(foodOrFailure);
  } else if (request is IsolateRequestFoodMappingRepositoryMapInput) {
    Either<Failure, FoodMappingResult> resultOrFailure =
        await getIt<FoodMappingRepository>().mapInput(request.input);
    await Future.delayed(const Duration(seconds: 1));
    return response(resultOrFailure);
  }
  return response(null);
}

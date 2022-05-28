import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:esnya/domain/isolate2/entities/isolate_response.dart';
import 'package:esnya/domain/resources/data_directory_path_provider.dart';
import 'package:esnya/domain/resources/resource_repository.dart';
import 'package:esnya/infrastructure/resources/resource_repository_impl_isolate_2.dart';
import 'package:esnya/injection.dart';
import 'package:esnya/injection_environments.dart';
import 'package:esnya/setup_services.dart';
import 'package:esnya_shared_resources/esnya_shared_resources.dart';
import 'package:loggy/loggy.dart';
import 'package:stream_channel/isolate_channel.dart';

import '../../domain/isolate2/entities/isolate_request.dart';
import 'isolate_2_spawn_arguments.dart';

void isolate2Main(Isolate2SpawnArguments args) {
  logInfo("Isolate 2 created");

  /////////////////////////////////
  // dependency injection and setup
  /////////////////////////////////

  DataDirectoryPathProvider.setDataDirectoryPath(args.dataDirectoryPath);
  configureInjection(isolate2.name);
  unawaited(setupServicesIsolate2());

  // do not await because we want to create channel and get app started as soon as possible.

  /////////////////////////////////
  // dependency injection
  /////////////////////////////////
  IsolateChannel channel = IsolateChannel.connectSend(args.sPort);
  channel.stream.listen((data) async {
    final request = data as IsolateRequest;
    final response = await makeRequest(request);
    channel.sink.add(response);
  });
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
    return response(resultOrFailure);
  } else if (request is IsolateRequestResourceStatusChanged) {
    (getIt<ResourceRepository>() as ResourceRepositoryImplIsolate2)
        .onReceiveResourceUpdateFromIsolate1(
            request.resourceId, request.newStatus);
    return response(null);
  }
  return response(null);
}

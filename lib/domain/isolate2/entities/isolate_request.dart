import 'dart:math';

import 'package:dartz/dartz.dart';
import 'package:esnya_shared_resources/esnya_shared_resources.dart';

import '../../resources/esnya_resource.dart';
import '../../resources/esnya_resource_status.dart';

final rng = Random();

/// R symbolizes the return type
abstract class IsolateRequest<R> {
  final int _hashCode;
  Type get getType => R;
  IsolateRequest() : _hashCode = rng.nextInt(1 << 32);
  static IsolateRequestHelloWorld helloWord(String message) =>
      IsolateRequestHelloWorld(message);

  static IsolateRequestFoodMappingRepositoryMapInput
      foodMappingRepositoryMapInput(String input) =>
          IsolateRequestFoodMappingRepositoryMapInput(input);

  static IsolateRequestFoodDataRepositoryGetFoodFromID
      foodDataRepositoryGetFoodFromID(String input) =>
          IsolateRequestFoodDataRepositoryGetFoodFromID(input);

  static IsolateRequestResourceStatusChanged resourceStatusChanged(
          EsnyaResourceId resourceId, EsnyaResourceStatus newStatus) =>
      IsolateRequestResourceStatusChanged(resourceId, newStatus);

  @override
  int get hashCode => _hashCode;

  @override
  operator ==(dynamic other) =>
      other is IsolateRequest && other.hashCode == _hashCode;
}

class IsolateRequestHelloWorld extends IsolateRequest<String> {
  final String message;
  IsolateRequestHelloWorld(this.message) : super();
}

class IsolateRequestFoodMappingRepositoryMapInput
    extends IsolateRequest<Either<Failure, FoodMappingResult>> {
  final String input;
  IsolateRequestFoodMappingRepositoryMapInput(this.input);
}

class IsolateRequestFoodDataRepositoryGetFoodFromID
    extends IsolateRequest<Either<DataFailure, Food>> {
  final String id;
  IsolateRequestFoodDataRepositoryGetFoodFromID(this.id);
}

class IsolateRequestResourceStatusChanged extends IsolateRequest<void> {
  final EsnyaResourceId resourceId;
  final EsnyaResourceStatus newStatus;
  IsolateRequestResourceStatusChanged(this.resourceId, this.newStatus);
}

class IsolateRequestFoodDataRepositorySetup
    extends IsolateRequest<Either<Failure, Unit>> {}

class IsolateRequestFoodMappingRepositorySetup
    extends IsolateRequest<Either<Failure, Unit>> {}

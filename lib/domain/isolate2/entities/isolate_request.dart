import 'dart:math';

import 'package:dartz/dartz.dart';
import 'package:esnya/domain/resources/esnya_resources.dart';
import 'package:esnya/domain/resources/resource_status.dart';
import 'package:esnya_shared_resources/esnya_shared_resources.dart';

final rng = Random();

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

  static IsolateRequestResourceStatusChanged
      resourceStatusChanged<T extends EsnyaResource>(
              String resourceId, ResourceStatus newStatus) =>
          IsolateRequestResourceStatusChanged(resourceId, newStatus);

  @override
  int get hashCode => _hashCode;

  @override
  operator ==(dynamic other) =>
      other is IsolateRequest && other.hashCode == _hashCode;
}

class IsolateRequestHelloWorld extends IsolateRequest<void> {
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

class IsolateRequestResourceStatusChanged<T extends EsnyaResource>
    extends IsolateRequest<void> {
  final String resourceId;
  final ResourceStatus newStatus;
  IsolateRequestResourceStatusChanged(this.resourceId, this.newStatus);
}

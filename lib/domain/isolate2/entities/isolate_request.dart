import 'package:freezed_annotation/freezed_annotation.dart';

abstract class IsolateRequest {
  const IsolateRequest();
  factory IsolateRequest.helloWord(String message) =>
      IsolateRequestHelloWorld(message);

  factory IsolateRequest.foodMappingRepositoryMapInput(String input) =>
      IsolateRequestFoodMappingRepositoryMapInput(input);

  factory IsolateRequest.foodDataRepositoryGetFoodFromID(String input) =>
      IsolateRequestFoodDataRepositoryGetFoodFromID(input);
}

class IsolateRequestHelloWorld extends IsolateRequest {
  final String message;
  const IsolateRequestHelloWorld(this.message);
}

class IsolateRequestFoodMappingRepositoryMapInput extends IsolateRequest {
  final String input;
  const IsolateRequestFoodMappingRepositoryMapInput(this.input);
}

class IsolateRequestFoodDataRepositoryGetFoodFromID extends IsolateRequest {
  final String id;
  const IsolateRequestFoodDataRepositoryGetFoodFromID(this.id);
}

import 'dart:math';

final rng = Random();

abstract class IsolateRequest {
  final int _hashCode;
  IsolateRequest() : _hashCode = rng.nextInt(1 << 32);
  factory IsolateRequest.helloWord(String message) =>
      IsolateRequestHelloWorld(message);

  factory IsolateRequest.foodMappingRepositoryMapInput(String input) =>
      IsolateRequestFoodMappingRepositoryMapInput(input);

  factory IsolateRequest.foodDataRepositoryGetFoodFromID(String input) =>
      IsolateRequestFoodDataRepositoryGetFoodFromID(input);

  @override
  int get hashCode => _hashCode;

  @override
  operator ==(dynamic other) =>
      other is IsolateRequest && other.hashCode == _hashCode;
}

class IsolateRequestHelloWorld extends IsolateRequest {
  final String message;
  IsolateRequestHelloWorld(this.message) : super();
}

class IsolateRequestFoodMappingRepositoryMapInput extends IsolateRequest {
  final String input;
  IsolateRequestFoodMappingRepositoryMapInput(this.input);
}

class IsolateRequestFoodDataRepositoryGetFoodFromID extends IsolateRequest {
  final String id;
  IsolateRequestFoodDataRepositoryGetFoodFromID(this.id);
}

import 'package:freezed_annotation/freezed_annotation.dart';
part 'isolate_request.freezed.dart';

@freezed
abstract class IsolateRequest with _$IsolateRequest {
  const factory IsolateRequest.helloWorld(String message) =
      IsolateRequestHelloWorld;
}

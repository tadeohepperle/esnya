import 'isolate_request.dart';

class IsolateResponse {
  final IsolateRequest request;
  final dynamic payload;

  IsolateResponse({required this.request, required this.payload});

  @override
  String toString() {
    return 'IsolateResponse(request: $request, payload: $payload)';
  }
}

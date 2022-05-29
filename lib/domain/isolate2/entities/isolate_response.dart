import 'isolate_request.dart';

class IsolateResponse<R> {
  final IsolateRequest request;

  /// should also be of type R but enforcing it yields syntax problems.
  final R payload;

  IsolateResponse({required this.request, required this.payload});

  @override
  String toString() {
    return 'IsolateResponse(request: $request, payload: $payload)';
  }
}

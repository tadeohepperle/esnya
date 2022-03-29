import 'package:freezed_annotation/freezed_annotation.dart';

import 'isolate_request.dart';
part 'isolate_response.freezed.dart';

@freezed
abstract class IsolateResponse with _$IsolateResponse {
  const factory IsolateResponse(
      {required IsolateRequest request,
      required Object payload}) = _IsolateResponse;
}

import 'package:freezed_annotation/freezed_annotation.dart';

part 'resource_request_event.freezed.dart';

@freezed
abstract class ResourceRequestStatus with _$ResourceRequestStatus {
  const factory ResourceRequestStatus.unknown() = Unknown;
  const factory ResourceRequestStatus.inProgress(double progress) = InProgress;
  const factory ResourceRequestStatus.available() = Available;
  const factory ResourceRequestStatus.failed() = Failed;
}

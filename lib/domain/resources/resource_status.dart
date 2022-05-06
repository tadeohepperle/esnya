import 'package:freezed_annotation/freezed_annotation.dart';
part 'resource_status.freezed.dart';

@freezed
abstract class ResourceStatus with _$ResourceStatus {
  const factory ResourceStatus.unknown() = Unknown;
  const factory ResourceStatus.inProgress(double progress) = InProgress;
  const factory ResourceStatus.available() = Available;
  const factory ResourceStatus.failed() = Failed;
}

import 'package:esnya_shared_resources/core/error_handling/failure.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'esnya_resource_status.freezed.dart';

@freezed
abstract class EsnyaResourceStatus with _$EsnyaResourceStatus {
  const factory EsnyaResourceStatus.unknown() = Unknown;
  const factory EsnyaResourceStatus.inProgress(double progress) = InProgress;
  const factory EsnyaResourceStatus.available() = Available;
  const factory EsnyaResourceStatus.failed([Failure? failure]) = Failed;
}

import 'package:esnya_shared_resources/core/error_handling/failure.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'failures.freezed.dart';

@freezed
abstract class ValueFailure<T> extends Failure with _$ValueFailure<T> {
  const ValueFailure._();
  const factory ValueFailure.invalidEmail({required String failedValue}) =
      InvalidEmail<T>;
  const factory ValueFailure.invalidPassword({required String failedValue}) =
      InvalidPassword<T>;
}

@freezed
abstract class SetupFailue extends Failure with _$SetupFailue {
  const SetupFailue._();
  const factory SetupFailue.isolateSpawnFailed() = _IsolateSpawnFailed;
}

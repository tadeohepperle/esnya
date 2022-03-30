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
abstract class ApiFailure with _$ApiFailure {
  const factory ApiFailure.unexpected() = _ApiFailureUnexpected;
}

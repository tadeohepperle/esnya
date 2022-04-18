import 'package:dartz/dartz.dart';
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
abstract class ApiFailure extends Failure with _$ApiFailure {
  const ApiFailure._();
  const factory ApiFailure.unexpected() = _ApiFailureUnexpected;
}

@freezed
abstract class FireStoreFailure extends Failure with _$FireStoreFailure {
  const FireStoreFailure._();
  const factory FireStoreFailure.notFound() = FireStoreFailureNotFound;
  const factory FireStoreFailure.unexpected() = FireStoreFailureUnexpected;
  const factory FireStoreFailure.insufficientPermission() =
      FireStoreFailureInsufficientPermission;
}

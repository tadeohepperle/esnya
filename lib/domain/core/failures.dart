import 'package:freezed_annotation/freezed_annotation.dart';
part 'failures.freezed.dart';

@freezed
abstract class ValueFailure<T> with _$ValueFailure<T> {
  const factory ValueFailure.invalidEmail({required String failedValue}) =
      InvalidEmail<T>;
  const factory ValueFailure.invalidPassword({required String failedValue}) =
      InvalidPassword<T>;
}

@freezed
abstract class TextFragmentizeFailure with _$TextFragmentizeFailure {
  const factory TextFragmentizeFailure.unexpected() = _TextFragmentizeFailure;
}

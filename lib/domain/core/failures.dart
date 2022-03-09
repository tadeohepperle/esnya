import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'failures.freezed.dart';

mixin Failure {
  FailureCode get code => FailureCode(runtimeType.toString());
}

@freezed
abstract class ValueFailure<T> with _$ValueFailure<T>, Failure {
  const ValueFailure._();
  const factory ValueFailure.invalidEmail({required String failedValue}) =
      InvalidEmail<T>;
  const factory ValueFailure.invalidPassword({required String failedValue}) =
      InvalidPassword<T>;
}

@freezed
abstract class TextFragmentizeFailure with _$TextFragmentizeFailure, Failure {
  const TextFragmentizeFailure._();
  const factory TextFragmentizeFailure.unexpected() = _TextFragmentizeFailure;
}

@freezed
abstract class FoodFetchingFailure with _$FoodFetchingFailure, Failure {
  const FoodFetchingFailure._();
  const factory FoodFetchingFailure.networkFailure() =
      _FoodFetchingNetworkFailure;
  const factory FoodFetchingFailure.unknownUnit() = _FoodFetchingUnknownUnit;
  const factory FoodFetchingFailure.unknownFood() = _FoodFetchingUnknownFood;
  const factory FoodFetchingFailure.localDataNotFound() =
      _FoodFetchingLocalDataNotFound;
}

class FailureCode extends Equatable {
  final String value;
  const FailureCode(this.value);

  @override
  String toString() => value.toString();

  @override
  List<Object?> get props => [value];
}

import 'package:dartz/dartz.dart';
import 'package:esnya/domain/core/errors.dart';

import 'failures.dart';

abstract class ValueObject<T> {
  const ValueObject();
  Either<ValueFailure<T>, T> get value;

  T get valueOrCrash => value.fold((f) => throw UnexpectedValueError(f), id);
  bool get isValid => value.isRight();
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ValueObject<T> && other.value == value);

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => 'Value($value)';
}

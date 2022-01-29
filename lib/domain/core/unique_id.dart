import 'package:dartz/dartz.dart';
import 'package:esnya/domain/core/failures.dart';
import 'package:esnya/domain/core/value_object.dart';
import 'package:uuid/uuid.dart';

const Uuid uuid = Uuid();

class UniqueId extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;
  factory UniqueId() {
    return UniqueId._(right(uuid.v1()));
  }
  factory UniqueId.fromTrustedIdString(String uniqueId) {
    assert(uniqueId.isNotEmpty);
    return UniqueId._(right(uniqueId));
  }
  const UniqueId._(this.value);
}

import 'package:dartz/dartz.dart';
import 'package:notes/domain/core/errors.dart';
import 'package:notes/domain/core/failures.dart';
import 'package:uuid/uuid.dart';

abstract class ValueObject<T> {
  const ValueObject();

  Either<ValueFailure<T>, T> get value;

  bool isValid() => value.isRight();

  //? Step 17: use UnexpectedValueError in ValueObject
  /// Throws [UnexpectedValueError] containing the [ValueFailure]
  T getOrCrash() {
    // id = identity: same as > (right) => right
    return value.fold((left) => throw UnexpectedValueError(left), id);
    // (left) => throw UnexpectedValueError(left), (right) => right);
  }

  //? Step 46: add [failureOrUnit] getter to [ValueObject] on domain to check the failure
  Either<ValueFailure<dynamic>, Unit> get failureOrUnit {
    return value.fold(
      (l) => left(l),
      (r) => right(unit),
    );
  }

  @override
  String toString() {
    return 'Value{$value}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ValueObject<T> &&
          runtimeType == other.runtimeType &&
          value == other.value);

  @override
  int get hashCode => value.hashCode;
}

//? Step 29: create [UniqueId] extends of [ValueObject] to set a contract to get UserId
//? Step 30: use [Uuid] class from package [uuid] to generate a unique user id
class UniqueId extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory UniqueId() {
    return UniqueId._(
      right(Uuid().v1()),
    );
  }

  factory UniqueId.fromUniqueString(String uniqueId) {
    assert(uniqueId != null);
    return UniqueId._(
      right(uniqueId),
    );
  }

  const UniqueId._(this.value);
}

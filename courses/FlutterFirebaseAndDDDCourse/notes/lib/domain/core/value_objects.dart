import 'package:dartz/dartz.dart';
import 'package:notes/domain/core/errors.dart';
import 'package:notes/domain/core/failures.dart';

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

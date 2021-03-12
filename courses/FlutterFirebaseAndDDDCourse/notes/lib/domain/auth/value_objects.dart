import 'package:dartz/dartz.dart';
import 'package:notes/domain/core/failures.dart';
import 'package:notes/domain/core/value_objects.dart';
import 'package:notes/domain/core/value_validators.dart';

//? Step 2: create EmailAddress class
class EmailAddress extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory EmailAddress(String input) {
    assert(input != null);
    return EmailAddress._(
      validateEmailAddress(input),
    );
  }

  const EmailAddress._(this.value);
}

//? Step 6: create Password class
class Password extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory Password(String input) {
    assert(input != null);
    return Password._(
      validatePassword(input),
    );
  }

  const Password._(this.value);
}

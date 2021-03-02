import 'package:dartz/dartz.dart';
import 'package:notes/domain/core/failures.dart';

Either<ValueFailure<String>, String> validateEmailAddress(String input) {
  const emailRegex =
      r"""^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$""";
  return RegExp(emailRegex).hasMatch(input)
      ? right(input)
      : left(ValueFailure.invalidEmail(failureValue: input));
}

Either<ValueFailure<String>, String> validatePassword(String input) {
  return input.length >= 6
      ? right(input)
      : left(ValueFailure.shortPassword(failureValue: input));
}

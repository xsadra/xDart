import 'package:dartz/dartz.dart';
import 'package:kt_dart/kt.dart';
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

//? Step 42: add [Notes] validators to [value_validator] file
Either<ValueFailure<String>, String> validateMaxStringLength(
  String input,
  int maxLength,
) {
  return input.length <= maxLength
      ? right(input)
      : left(ValueFailure.exceedingLength(failureValue: input, max: maxLength));
}

Either<ValueFailure<String>, String> validateStringNotEmpty(String input) {
  return input.isNotEmpty
      ? right(input)
      : left(ValueFailure.empty(failureValue: input));
}

Either<ValueFailure<String>, String> validateSingleLine(String input) {
  // use ! to reverse the condition and return [right] first
  return !input.contains('\n')
      ? right(input)
      : left(ValueFailure.multiline(failureValue: input));
}

Either<ValueFailure<KtList<T>>, KtList<T>> validateMaxListLength<T>(
  KtList<T> input,
  int maxLength,
) {
  return input.size <= maxLength
      ? right(input)
      : left(ValueFailure.listTooLong(failureValue: input, max: maxLength));
}

import 'package:freezed_annotation/freezed_annotation.dart';

//? Step 4: add part file to the class
//! Step 5: in terminal>> flutter pub run build_runner watch
part 'failures.freezed.dart';

//? Step 3: configure freezed part to generate ValueFailure
@freezed
abstract class ValueFailure<T> with _$ValueFailure<T> {
  const factory ValueFailure.invalidEmail({
    @required String failureValue,
  }) = InvalidEmail<T>;

  const factory ValueFailure.shortPassword({
    @required String failureValue,
  }) = ShortPassword<T>;
}

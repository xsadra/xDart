import 'package:freezed_annotation/freezed_annotation.dart';

//? Step 4: add part file to the class
//! Step 5: in terminal>> flutter pub run build_runner watch --delete-conflicting-outputs
//? Step 41: add [Notes] failures to [ValueFailure]
part 'failures.freezed.dart';

//? Step 3: configure freezed part to generate ValueFailure
@freezed
abstract class ValueFailure<T> with _$ValueFailure<T> {
  const factory ValueFailure.invalidEmail({
    @required T failureValue,
  }) = InvalidEmail<T>;

  const factory ValueFailure.shortPassword({
    @required T failureValue,
  }) = ShortPassword<T>;

  const factory ValueFailure.exceedingLength({
    @required T failureValue,
    @required int max,
  }) = ExceedingLength<T>;

  const factory ValueFailure.empty({
    @required T failureValue,
  }) = Empty<T>;

  const factory ValueFailure.multiline({
    @required T failureValue,
  }) = Multiline<T>;

  const factory ValueFailure.listTooLong({
    @required T failureValue,
    @required int max,
  }) = ListTooLong<T>;
}

// how to separate Failures in different classes
// @freezed
// abstract class ValueFailure<T> with _$ValueFailure<T> {
//   const factory ValueFailure.auth(AuthValueFailure<T> f) = _Auth<T>;
//   const factory ValueFailure.notes(NotesValueFailure<T> f) = _Notes<T>;
// }
//
// abstract class AuthValueFailure<T> with _$AuthValueFailure<T> {
//   const factory AuthValueFailure.invalidEmail({
//     @required String failureValue,
//   }) = InvalidEmail<T>;
//
//   const factory AuthValueFailure.shortPassword({
//     @required String failureValue,
//   }) = ShortPassword<T>;
// }
// abstract class NotesValueFailure<T> with _$NotesValueFailure<T> {
//   const factory NotesValueFailure.exceedingLength({
//     @required String failureValue,
//   }) = ExceedingLength<T>;
// }

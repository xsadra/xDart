import 'package:notes/domain/core/failures.dart';

//? Step 16: create a Error class to kill the app on unhandled state
class UnexpectedValueError extends Error {
  final ValueFailure valueFailure;

  UnexpectedValueError(this.valueFailure);
  @override
  String toString() {
    const explanation = 'Unexpected point in ValueFailure. Terminating.';
    return Error.safeToString('$explanation Error: $valueFailure');
  }
}

//? Step 56: create a Error class to kill the app on getting firestore snapshots
class NotAuthenticatedError extends Error {}

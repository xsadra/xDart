import 'package:freezed_annotation/freezed_annotation.dart';

part 'note_failure.freezed.dart';

//? Step 49: create [NoteFailure]
//? Step 57: add [InsufficientPermission] to [NoteFailure]
@freezed
abstract class NoteFailure with _$NoteFailure {
  const factory NoteFailure.unexpected() = _Unexpected;
  const factory NoteFailure.insufficientPermission() = _InsufficientPermission;
}

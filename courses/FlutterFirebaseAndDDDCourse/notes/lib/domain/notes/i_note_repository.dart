import 'package:dartz/dartz.dart';
import 'package:kt_dart/kt.dart';

import 'note.dart';
import 'note_failure.dart';

//? Step 50: create [INoteRepository] interface to communicate with DB
abstract class INoteRepository {
  Stream<Either<NoteFailure, KtList<Note>>> watchAll();

  Stream<Either<NoteFailure, KtList<Note>>> watchUncompleted();

  Future<Either<NoteFailure, Unit>> create(Note note);

  Future<Either<NoteFailure, Unit>> update(Note note);

  Future<Either<NoteFailure, Unit>> delete(Note note);
}

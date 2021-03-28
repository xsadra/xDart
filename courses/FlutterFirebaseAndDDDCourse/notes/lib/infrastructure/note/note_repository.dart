import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:kt_dart/kt.dart';
import 'package:notes/domain/notes/i_note_repository.dart';
import 'package:notes/domain/notes/note.dart';
import 'package:notes/domain/notes/note_failure.dart';
import 'package:notes/infrastructure/core/firesrore_helpers.dart';
import 'package:notes/infrastructure/note/note_dtos.dart';
import 'package:rxdart/rxdart.dart';

//? Step 60: create [NoteRepository] implements [INoteRepository]
//? Step 61: implements [watchAll, watchUncompleted]
//? Step 63: implements [create, update, delete]
@LazySingleton(as: INoteRepository)
class NoteRepository implements INoteRepository {
  final FirebaseFirestore _firestore;

  NoteRepository(this._firestore);

  @override
  Future<Either<NoteFailure, Unit>> create(Note note) async {
    try {
      final userDoc = await _firestore.userDocument();
      final noteDto = NoteDto.fromDomain(note);

      await userDoc.noteCollection.doc(noteDto.id).set(noteDto.toJson());
      return right(unit);
    } on FirebaseAuthException catch (e) {
      if (e.message.contains('PERMISSION_DENIED')) {
        return left(const NoteFailure.unableToUpdate());
      }
      return left(const NoteFailure.unexpected());
    }
  }

  @override
  Future<Either<NoteFailure, Unit>> delete(Note note) async {
    try {
      final userDoc = await _firestore.userDocument();
      final noteId = note.id.getOrCrash();

      await userDoc.noteCollection.doc(noteId).delete();
      return right(unit);
    } on FirebaseAuthException catch (e) {
      if (e.message.contains('PERMISSION_DENIED')) {
        return left(const NoteFailure.insufficientPermission());
      } else if (e.message.contains('NOT_FOUND')) {
        return left(const NoteFailure.unableToUpdate());
      }
      return left(const NoteFailure.unexpected());
    }
  }

  @override
  Future<Either<NoteFailure, Unit>> update(Note note) async {
    try {
      final userDoc = await _firestore.userDocument();
      final noteDto = NoteDto.fromDomain(note);

      await userDoc.noteCollection.doc(noteDto.id).update(noteDto.toJson());
      return right(unit);
    } on FirebaseAuthException catch (e) {
      if (e.message.contains('PERMISSION_DENIED')) {
        return left(const NoteFailure.insufficientPermission());
      } else if (e.message.contains('NOT_FOUND')) {
        return left(const NoteFailure.unableToUpdate());
      }
      return left(const NoteFailure.unexpected());
    }
  }

  //? Step 62: using [onErrorReturnWith] from [rxdart] package to catch stream errors
  @override
  Stream<Either<NoteFailure, KtList<Note>>> watchAll() async* {
    final userDoc = await _firestore.userDocument();
    yield* userDoc.noteCollection
        .orderBy('serverTimeStamp', descending: true)
        .snapshots()
        .map(
          (snapshot) => right<NoteFailure, KtList<Note>>(
            snapshot.docs
                .map((document) => NoteDto.fromFirestore(document).toDomain())
                .toImmutableList(),
          ),
        )
        .onErrorReturnWith((error) {
      if (error is FirebaseAuthException &&
          error.message.contains('PERMISSION_DENIED')) {
        return left(const NoteFailure.insufficientPermission());
      }
      return left(const NoteFailure.unexpected());
    });
  }

  @override
  Stream<Either<NoteFailure, KtList<Note>>> watchUncompleted() async* {
    final userDoc = await _firestore.userDocument();
    yield* userDoc.noteCollection
        .orderBy('serverTimeStamp', descending: true)
        .snapshots()
        .map(
          (snapshot) => snapshot.docs
              .map((document) => NoteDto.fromFirestore(document).toDomain()),
        )
        .map(
          (notes) => right<NoteFailure, KtList<Note>>(
            notes
                .where((note) =>
                    note.todos.getOrCrash().any((todoItem) => !todoItem.done))
                .toImmutableList(),
          ),
        )
        .onErrorReturnWith((error) {
      if (error is FirebaseAuthException &&
          error.message.contains('PERMISSION_DENIED')) {
        return left(const NoteFailure.insufficientPermission());
      }
      return left(const NoteFailure.unexpected());
    });
  }
}

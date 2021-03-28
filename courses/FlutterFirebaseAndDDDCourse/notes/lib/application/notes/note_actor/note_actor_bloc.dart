import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:notes/domain/notes/i_note_repository.dart';
import 'package:notes/domain/notes/note.dart';
import 'package:notes/domain/notes/note_failure.dart';

part 'note_actor_bloc.freezed.dart';
part 'note_actor_event.dart';
part 'note_actor_state.dart';

//? Step 54: generate [NoteActorBBloc] bloC using bloc generator
//? Step 55: configure [NoteActorBEvent, NoteActorBEvent] class
@injectable
class NoteActorBloc extends Bloc<NoteActorEvent, NoteActorState> {
  final INoteRepository _noteRepository;

  NoteActorBloc(this._noteRepository) : super(const NoteActorState.initial());

  @override
  Stream<NoteActorState> mapEventToState(NoteActorEvent event) async* {
    yield const NoteActorState.actionInProgress();
    final possibleFailure = await _noteRepository.delete(event.note);
    yield possibleFailure.fold(
      (failure) => NoteActorState.deleteFailure(failure),
      (_) => const NoteActorState.deleteSuccess(),
    );
  }
}

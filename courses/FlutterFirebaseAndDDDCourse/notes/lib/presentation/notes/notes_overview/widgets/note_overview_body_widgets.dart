import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/application/notes/note_watcher/note_watcher_bloc.dart';

import 'critical_failure_display_widget.dart';
import 'error_note_card_widget.dart';
import 'note_card_widget.dart';

//? Step 71: create [NoteOverviewBody] widget using [BlocBuilder] to get notes
//? Step 74: use [NoteCard, ErrorNoteCard, CriticalFailureDisplay]
class NoteOverviewBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NoteWatcherBloc, NoteWatcherState>(
      builder: (context, state) {
        return state.map(
          initial: (_) => Container(color: Colors.grey),
          loadInProgress: (_) =>
              const Center(child: CircularProgressIndicator()),
          loadSuccess: (state) {
            return ListView.builder(
              itemCount: state.notes.size,
              itemBuilder: (context, index) {
                final note = state.notes[index];
                if (note.failureOption.isSome()) {
                  return ErrorNoteCard(note: note);
                }
                return NoteCard(note: note);
              },
            );
          },
          loadFailure: (state) =>
              CriticalFailureDisplay(failure: state.failure),
        );
      },
    );
  }
}

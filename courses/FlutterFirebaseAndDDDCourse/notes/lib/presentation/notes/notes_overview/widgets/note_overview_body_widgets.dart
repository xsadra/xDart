import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/application/notes/note_watcher/note_watcher_bloc.dart';

//? Step 71: create [NoteOverviewBody] widget using [BlocBuilder] to get notes
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
                  return Container(color: Colors.yellowAccent, height: 100);
                }
                return Container(color: Colors.green, height: 100);
              },
            );
          },
          loadFailure: (state) => Container(color: Colors.red, height: 100),
        );
      },
    );
  }
}

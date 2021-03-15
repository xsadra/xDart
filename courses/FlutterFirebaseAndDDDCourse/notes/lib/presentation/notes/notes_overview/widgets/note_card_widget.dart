import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kt_dart/kt.dart';
import 'package:notes/application/notes/note_actor/note_actor_bloc.dart';
import 'package:notes/domain/notes/note.dart';
import 'package:notes/domain/notes/todo_item.dart';
import 'package:notes/presentation/routes/router.gr.dart';

//? Step 74: create [NoteCard] to show notes
class NoteCard extends StatelessWidget {
  final Note note;

  const NoteCard({
    Key key,
    @required this.note,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: note.color.getOrCrash(),
      child: InkWell(
        onTap: () =>
            ExtendedNavigator.of(context).pushNoteFormPage(editedNote: note),
        onLongPress: () {
          final noteActorBloc = context.read<NoteActorBloc>();
          _showDeletingDialog(context, noteActorBloc);
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                note.body.getOrCrash(),
                style: const TextStyle(fontSize: 18.8),
              ),
              if (note.todos.length > 0) ...[
                const SizedBox(height: 4.0),
                Wrap(
                  spacing: 8,
                  children: [
                    ...note.todos
                        .getOrCrash()
                        .map((todo) => TodoDisplay(todo: todo))
                        .iter,
                  ],
                ),
              ]
            ],
          ),
        ),
      ),
    );
  }

  void _showDeletingDialog(BuildContext context, NoteActorBloc bloc) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Selected Note:'),
          content: Text(
            note.body.getOrCrash(),
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
          actions: [
            FlatButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            FlatButton(
              onPressed: () {
                bloc.add(NoteActorEvent.deleted(note));
                Navigator.pop(context);
              },
              child: const Text('Delete'),
            ),
          ],
        );
      },
    );
  }
}

class TodoDisplay extends StatelessWidget {
  final TodoItem todo;

  const TodoDisplay({
    Key key,
    @required this.todo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (todo.done)
          Icon(
            Icons.check_box,
            color: Colors.blueGrey.shade500,
          ),
        if (!todo.done)
          Icon(
            Icons.check_box_outline_blank,
            color: Theme.of(context).disabledColor,
          ),
        Text(todo.name.getOrCrash()),
      ],
    );
  }
}

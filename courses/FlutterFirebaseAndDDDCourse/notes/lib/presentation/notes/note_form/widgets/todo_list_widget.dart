import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:kt_dart/kt.dart';
import 'package:notes/application/notes/note_form/note_form_bloc.dart';
import 'package:notes/presentation/core/show_snack_bar.dart';
import 'package:notes/presentation/notes/note_form/misc/build_context_x.dart';
import 'package:notes/presentation/notes/note_form/misc/todo_item_presentation_classes.dart';
import 'package:provider/provider.dart';

//? Step 89: create [TodoList]
class TodoList extends StatelessWidget {
  const TodoList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<NoteFormBloc, NoteFormState>(
      listenWhen: (previous, current) =>
          previous.note.todos.isFull != current.note.todos.isFull,
      listener: (context, state) {
        if (state.note.todos.isFull) {
          showSnackBar(context, message: 'Want more todos? Active premium.');
        }
      },
      child: Consumer<FormTodos>(
        builder: (context, formTodos, child) => ListView.builder(
          shrinkWrap: true,
          itemCount: formTodos.value.size,
          itemBuilder: (_, index) => TodoTile(index: index),
        ),
      ),
    );
  }
}

class TodoTile extends HookWidget {
  final int index;

  const TodoTile({
    @required this.index,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final todo =
        context.formTodos.getOrElse(index, (_) => TodoItemPrimitive.empty());

    return ListTile(
      leading: Checkbox(
        value: todo.done,
        onChanged: (value) {
          context.formTodos = context.formTodos.map(
            (listTodo) =>
                listTodo == todo ? todo.copyWith(done: value) : listTodo,
          );
          context
              .read<NoteFormBloc>()
              .add(NoteFormEvent.todosChanged(context.formTodos));
        },
      ),
    );
  }
}

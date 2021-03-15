import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kt_dart/kt.dart';
import 'package:notes/application/notes/note_form/note_form_bloc.dart';
import 'package:notes/presentation/notes/note_form/misc/build_context_x.dart';
import 'package:notes/presentation/notes/note_form/misc/todo_item_presentation_classes.dart';
import 'package:provider/provider.dart';

//? Step 84: create [AddTodoTile] to create a new TodoItem
//? Step 85: use [BlocConsumer] listener to get exist Todos item from note in edit
class AddTodoTile extends StatelessWidget {
  const AddTodoTile({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NoteFormBloc, NoteFormState>(
        listenWhen: (previous, current) =>
            previous.isEditing != current.isEditing,
        listener: (context, state) {
          context.formTodos = state.note.todos.value.fold(
            (f) => listOf<TodoItemPrimitive>(),
            (todoItemList) =>
                todoItemList.map((_) => TodoItemPrimitive.fromDomain(_)),
          );
        },
        buildWhen: (previous, current) =>
            previous.note.todos.isFull != current.note.todos.isFull,
        builder: (context, state) => ListTile(
              enabled: !state.note.todos.isFull,
              title: const Text('Add a todo'),
              leading: const Padding(
                padding: EdgeInsets.all(12.0),
                child: Icon(Icons.add),
              ),
              onTap: () {
                //? Step 86: add a new empty [TodoItemPrimitive] to todos
                //? add a todosChange event to bloC
                context.formTodos =
                    context.formTodos.plusElement(TodoItemPrimitive.empty());
                context
                    .read<NoteFormBloc>()
                    .add(NoteFormEvent.todosChanged(context.formTodos));
              },
            ));
  }
}

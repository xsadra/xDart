import 'package:flutter/widgets.dart';
import 'package:kt_dart/kt.dart';
import 'package:notes/presentation/notes/note_form/misc/todo_item_presentation_classes.dart';
import 'package:provider/provider.dart';

//? Step 83: create [FormTodosX] extension on [BuildContext] to use [formTodos]
//? instead of  [Provider.of<FormTodos>(this, listen: false).value]
extension FormTodosX on BuildContext {
  KtList<TodoItemPrimitive> get formTodos =>
      Provider.of<FormTodos>(this, listen: false).value;

  set formTodos(KtList<TodoItemPrimitive> value) =>
      Provider.of<FormTodos>(this, listen: false).value = value;
}

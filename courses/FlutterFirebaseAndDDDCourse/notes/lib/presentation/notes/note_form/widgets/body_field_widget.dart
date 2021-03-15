import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:notes/application/notes/note_form/note_form_bloc.dart';
import 'package:notes/domain/notes/value_objects.dart';

//? Step 78: create [BodyField] to create and edit a new note
class BodyField extends HookWidget {
  const BodyField({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textEditingController = useTextEditingController();

    return BlocListener<NoteFormBloc, NoteFormState>(
      listenWhen: (previous, current) =>
          previous.isEditing != current.isEditing,
      listener: (BuildContext context, state) {
        textEditingController.text = state.note.body.getOrCrash();
      },
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: TextFormField(
          controller: textEditingController,
          decoration: const InputDecoration(
            labelText: 'Note',
          ),
          maxLength: NoteBody.maxLength,
          minLines: 5,
          maxLines: 10,
          onChanged: (value) => context
              .read<NoteFormBloc>()
              .add(NoteFormEvent.bodyChanged(value)),
          validator: (val) =>
              context.read<NoteFormBloc>().state.note.body.value.fold(
                    (f) => f.maybeMap(
                      empty: (value) => 'Cannot be empty',
                      exceedingLength: (value) =>
                          'exceeding length, max: ${value.max}',
                      orElse: () => 'or else',
                    ),
                    (r) => null,
                  ),
        ),
      ),
    );
  }
}

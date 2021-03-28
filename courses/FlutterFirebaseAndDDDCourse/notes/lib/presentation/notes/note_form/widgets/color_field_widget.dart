import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/application/notes/note_form/note_form_bloc.dart';
import 'package:notes/domain/notes/value_objects.dart';

//? Step 80: create [ColorField] to show note colors
class ColorField extends StatelessWidget {
  const ColorField({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NoteFormBloc, NoteFormState>(
      buildWhen: (previous, current) =>
          previous.note.color != current.note.color,
      builder: (context, state) {
        return SizedBox(
          height: 80.0,
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              final itemColor = NoteColor.predefinedColors[index];
              return GestureDetector(
                onTap: () => context
                    .read<NoteFormBloc>()
                    .add(NoteFormEvent.colorChanged(itemColor)),
                child: Material(
                  color: itemColor,
                  elevation: 4,
                  shape: CircleBorder(
                    side: state.note.color.value.fold(
                      (_) => BorderSide.none,
                      (color) => color == itemColor
                          ? const BorderSide(width: 1.5)
                          : BorderSide.none,
                    ),
                  ),
                  child: const SizedBox(
                    width: 50,
                    height: 50,
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) => const SizedBox(width: 12.0),
            itemCount: NoteColor.predefinedColors.length,
          ),
        );
      },
    );
  }
}

import 'package:auto_route/auto_route.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/application/notes/note_form/note_form_bloc.dart';
import 'package:notes/domain/notes/note.dart';
import 'package:notes/injection.dart';
import 'package:notes/presentation/notes/note_form/widgets/body_field_widget.dart';
import 'package:notes/presentation/notes/note_form/widgets/color_field_widget.dart';
import 'package:notes/presentation/routes/router.gr.dart';

//? Step 77: create [NoteFormPage] to create and edit a notes
class NoteFormPage extends StatelessWidget {
  final Note editedNote;

  const NoteFormPage({
    Key key,
    @required this.editedNote,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<NoteFormBloc>()
        ..add(NoteFormEvent.initialized(optionOf(editedNote))),
      child: BlocConsumer<NoteFormBloc, NoteFormState>(
        listenWhen: (previous, current) =>
            previous.saveFailureOrSuccessOption !=
            current.saveFailureOrSuccessOption,
        listener: (BuildContext context, state) {
          state.saveFailureOrSuccessOption.fold(
            () => null,
            (either) {
              either.fold(
                (failure) {
                  showSnackBar(
                    context,
                    failure.map(
                      unexpected: (_) =>
                          'Unexpected error. Please contact support.',
                      insufficientPermission: (_) => 'Insufficient Permissions',
                      unableToUpdate: (_) =>
                          'Unable to update the Note. Was id deleted from another device?',
                    ),
                  );
                },
                (_) {
                  ExtendedNavigator.of(context).popUntil((route) =>
                      route.settings.name == Routes.notesOverviewPage);
                },
              );
            },
          );
        },
        buildWhen: (previous, current) => previous.isSaving != current.isSaving,
        builder: (context, state) {
          return Stack(
            children: [
              const NoteFormScaffold(),
              SavingInProgressOverlay(isSaving: state.isSaving),
            ],
          );
        },
      ),
    );
  }

  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showSnackBar(
      BuildContext context, String message) {
    return Scaffold.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }
}

class SavingInProgressOverlay extends StatelessWidget {
  final bool isSaving;

  const SavingInProgressOverlay({
    Key key,
    @required this.isSaving,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: !isSaving,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        color: isSaving ? Colors.black.withOpacity(0.8) : Colors.transparent,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Visibility(
          visible: isSaving,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircularProgressIndicator(),
              const SizedBox(height: 10.0),
              Text(
                'Saving',
                style: Theme.of(context).textTheme.bodyText2.copyWith(
                      color: Colors.white,
                      fontSize: 17.0,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NoteFormScaffold extends StatelessWidget {
  const NoteFormScaffold({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: BlocBuilder<NoteFormBloc, NoteFormState>(
          buildWhen: (previous, current) =>
              previous.isEditing != current.isEditing,
          builder: (context, state) {
            return Text(state.isEditing ? 'Edit a Note' : 'Create a Note');
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: () {
              context.read<NoteFormBloc>().add(const NoteFormEvent.saved());
            },
          )
        ],
      ),
      //? Step 79: use [BodyField] in [NoteFormPage] as body
      body: BlocBuilder<NoteFormBloc, NoteFormState>(
        buildWhen: (previous, current) =>
            previous.showErrorMessages != current.showErrorMessages,
        builder: (context, state) => Form(
          child: SingleChildScrollView(
            child: Form(
              autovalidateMode: AutovalidateMode.always,
              child: Column(
                children: const [
                  BodyField(),
                  ColorField(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

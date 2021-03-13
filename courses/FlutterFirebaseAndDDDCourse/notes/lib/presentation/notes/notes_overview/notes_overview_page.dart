import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/application/auth/auth_bloc.dart';
import 'package:notes/application/notes/note_actor/note_actor_bloc.dart';
import 'package:notes/application/notes/note_watcher/note_watcher_bloc.dart';
import 'package:notes/injection.dart';
import 'package:notes/presentation/notes/notes_overview/widgets/note_overview_body_widgets.dart';
import 'package:notes/presentation/notes/notes_overview/widgets/uncompleted_switch.dart';
import 'package:notes/presentation/routes/router.gr.dart';

//? Step 70: create [NotesOverviewPage] page
class NotesOverviewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<NoteWatcherBloc>(
          create: (context) => getIt<NoteWatcherBloc>()
            ..add(const NoteWatcherEvent.watchAllStarted()),
        ),
        BlocProvider<NoteActorBloc>(
          create: (context) => getIt<NoteActorBloc>(),
        ),
      ],
      child: MultiBlocListener(
        listeners: [
          BlocListener<AuthBloc, AuthState>(
            listener: (context, state) {
              state.maybeMap(
                unauthenticated: (_) =>
                    ExtendedNavigator.of(context).replace(Routes.signInPage),
                orElse: () {},
              );
            },
          ),
          BlocListener<NoteActorBloc, NoteActorState>(
            listener: (context, state) {
              state.maybeMap(
                  deleteFailure: (state) {
                    showSnackBar(
                      context: context,
                      message: state.noteFailure.map(
                        unexpected: (_) =>
                            'Unexpected error occurred while deleting!',
                        insufficientPermission: (_) =>
                            'Insufficient permission',
                        unableToUpdate: (_) => 'Could not Delete!',
                      ),
                    );
                  },
                  orElse: () {});
            },
          ),
        ],
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Notes'),
            leading: IconButton(
              icon: const Icon(Icons.exit_to_app),
              onPressed: () {
                context.bloc<AuthBloc>().add(const AuthEvent.signedOut());
              },
            ),
            actions: [
              UncompletedSwitch(),
            ],
          ),
          body: NoteOverviewBody(),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              ExtendedNavigator.of(context).pushNoteFormPage(editedNote: null);
            },
            child: const Icon(Icons.add),
          ),
        ),
      ),
    );
  }

  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showSnackBar(
      {BuildContext context, String message}) {
    return Scaffold.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 5),
      ),
    );
  }
}

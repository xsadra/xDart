import 'package:auto_route/auto_route_annotations.dart';
import 'package:notes/presentation/notes/note_form/note_form_page.dart';
import 'package:notes/presentation/notes/notes_overview/notes_overview_page.dart';
import 'package:notes/presentation/sign_in/sign_in_page.dart';
import 'package:notes/presentation/splash/splash_page.dart';

//? Step 35: add [auto_route, auto_route_generator] to pubspec and use it to manage routes
@MaterialAutoRouter(
    generateNavigationHelperExtension: true,
    routes: <AutoRoute>[
      MaterialRoute(page: SplashPage, initial: true),
      MaterialRoute(page: SignInPage),
      MaterialRoute(page: NotesOverviewPage),
      MaterialRoute(page: NoteFormPage, fullscreenDialog: true),
    ])
class $Router {}

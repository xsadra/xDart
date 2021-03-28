import 'package:auto_route/auto_route.dart' as r;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/application/auth/auth_bloc.dart';
import 'package:notes/presentation/routes/router.gr.dart' as r;

//? Step 39: create [SplashPage] to set a Page on loading
class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        state.map(
          initial: (_) => throw UnimplementedError(),
          //? Step 69: navigate to [NotesOverviewPage] on authenticated
          authenticated: (_) => r.ExtendedNavigator.of(context)
              .replace(r.Routes.notesOverviewPage),
          unauthenticated: (_) =>
              r.ExtendedNavigator.of(context).replace(r.Routes.signInPage),
        );
      },
      child: const Scaffold(
        backgroundColor: Colors.white70,
        body: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}

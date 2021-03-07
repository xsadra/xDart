import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/application/auth/auth_bloc.dart';
import 'package:notes/presentation/routes/router.gr.dart';

//? Step 39: create [SplashPage] to set a Page on loading
class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        state.map(
          initial: (_) => throw UnimplementedError(),
          authenticated: (_) => throw UnimplementedError(),
          unauthenticated: (_) => ExtendedNavigator.of(context)
              .pushReplacementNamed(Routes.signInPage),
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

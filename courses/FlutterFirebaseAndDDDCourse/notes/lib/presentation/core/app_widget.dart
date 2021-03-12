import 'package:auto_route/auto_route.dart' as r;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/application/auth/auth_bloc.dart';
import 'package:notes/injection.dart';
import 'package:notes/presentation/routes/router.gr.dart' as r;

//? Step 25: move root widget to app_widget file and modify theme
//? Step 40: use [MultiBlocProvider] in [AppWidget] to add AuthEvent to widget tree

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<AuthBloc>()
            ..add(
              const AuthEvent.autoCheckRequested(),
            ),
        )
      ],
      child: MaterialApp(
        title: 'Notes',
        builder: r.ExtendedNavigator(
          router: r.Router(),
        ),
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light().copyWith(
            primaryColor: Colors.blueGrey.shade700,
            accentColor: Colors.blueGrey.shade500,
            floatingActionButtonTheme: FloatingActionButtonThemeData(
                backgroundColor: Colors.blueGrey.shade900),
            inputDecorationTheme: InputDecorationTheme(
                border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ))),
      ),
    );
  }
}

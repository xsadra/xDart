import 'package:flutter/material.dart';
import 'package:notes/presentation/sign_in/sign_in_page.dart';

//? Step 25: move root widget to app_widget file and modify theme
class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Notes',
      home: SignInPage(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
          primaryColor: Colors.blueGrey.shade700,
          accentColor: Colors.blueGrey.shade500,
          inputDecorationTheme: InputDecorationTheme(
              border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ))),
    );
  }
}

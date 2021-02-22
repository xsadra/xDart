import 'package:flutter/material.dart';
import 'package:number_trivia/features/number_trivia/presentation/pages/number_trivia_page.dart';

import 'injection_container.dart' as injections;

void main() async {
  await injections.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Number Trivia',
      theme: ThemeData(
        primaryColor: Colors.blueGrey.shade700,
        accentColor: Colors.blueGrey.shade500,
      ),
      home: NumberTriviaPage(),
    );
  }
}

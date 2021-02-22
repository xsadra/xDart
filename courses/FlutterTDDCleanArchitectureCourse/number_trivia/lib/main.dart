import 'package:flutter/material.dart';
import 'package:number_trivia/injection_container.dart' as injection;

void main() async {
  await injection.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Number Trivia',
      home: Scaffold(
        body: Center(child: Text("Body")),
      ),
    );
  }
}

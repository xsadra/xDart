import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Routes & Navigation",
      home: Scaffold(
        appBar: AppBar(
          title: Text("Routes & Navigation"),
        ),
        body: Center(child: Text("Body")),
      ),
    );
  }
}

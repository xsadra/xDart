import 'package:flutter/material.dart';

void main() {
  runApp(NotesApp());
}

class NotesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Notes',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Notes'),
        ),
        body: Center(
          child: Container(
            child: Text('Notes App'),
          ),
        ),
      ),
    );
  }
}

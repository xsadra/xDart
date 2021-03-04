import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:notes/injection.dart';

void main() {
  configureDependencies(env: Environment.prod);
  runApp(NotesApp());
}

class NotesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Notes',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Notes'),
        ),
        body: const Center(
          child: Text('Notes App'),
        ),
      ),
    );
  }
}

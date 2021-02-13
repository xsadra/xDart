import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  final String name;
  final int age;

  SecondPage({
    @required this.name,
    @required this.age,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              name,
              style: Theme.of(context).textTheme.headline3,
            ),
            Text(
              age.toString(),
              style: Theme.of(context).textTheme.headline4,
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  final String data;

  const SecondPage({Key key, @required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Routes & Navigation"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Second Page",
              style: TextStyle(
                fontSize: 66.0,
                color: Colors.blue,
              ),
            ),
            Text(
              "Go to Second Page",
              style: TextStyle(
                fontSize: 33.0,
                color: Colors.green,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

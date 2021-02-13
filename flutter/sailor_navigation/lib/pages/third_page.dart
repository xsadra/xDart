import 'package:flutter/material.dart';
import 'package:sailor/sailor.dart';

// 1.2 extend args from sailor BaseArguments
class ThirdPageArgs extends BaseArguments {
  final String name;
  final int age;

  ThirdPageArgs({
    @required this.name,
    @required this.age,
  });
}

class ThirdPage extends StatelessWidget {
  final ThirdPageArgs args;

  ThirdPage({@required this.args});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Third Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              args.name,
              style: Theme.of(context).textTheme.headline3,
            ),
            Text(
              args.age.toString(),
              style: Theme.of(context).textTheme.headline4,
            )
          ],
        ),
      ),
    );
  }
}

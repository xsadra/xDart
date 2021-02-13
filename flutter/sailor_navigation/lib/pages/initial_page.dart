import 'package:flutter/material.dart';

import 'second_page.dart';
import 'third_page.dart';

class InitialPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('First Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: const Text('Go to SECOND'),
              onPressed: () => navigateToSecond(context),
            ),
            const SizedBox(height: 12.0),
            ElevatedButton(
              child: const Text('Go to THIRD'),
              onPressed: () => navigateToThird(context),
            ),
          ],
        ),
      ),
    );
  }

  void navigateToSecond(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => SecondPage(
        name: 'Sadra',
        age: 26,
      ),
    ));
  }

  void navigateToThird(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => ThirdPage(
        args: ThirdPageArgs(
          name: 'Sara',
          age: 17,
        ),
      ),
    ));
  }
}

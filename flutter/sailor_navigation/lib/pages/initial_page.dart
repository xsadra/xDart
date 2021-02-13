import 'package:flutter/material.dart';

import '../main.dart';
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
              onPressed: () async => navigateToThird(context),
            ),
          ],
        ),
      ),
    );
  }

  // 4- use sailor navigate
  void navigateToThird(BuildContext context) async {
    Routes.sailor.navigate(RoutePaths.ThirdPage,
        args: ThirdPageArgs(name: 'Sara', age: 11));
  }

  // 4.1- use sailor navigate
  void navigateToSecond(BuildContext context) {
    Routes.sailor.navigate(
      RoutePaths.secondPage,
      params: {'name': 'Sadra', 'age': 26},
    );
  }
}

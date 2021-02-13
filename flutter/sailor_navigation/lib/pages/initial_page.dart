import 'package:flutter/material.dart';
import 'package:sailor/sailor.dart';

import '../routes.dart';
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
              onPressed: () => navigateToSecond(),
            ),
            const SizedBox(height: 12.0),
            ElevatedButton(
              child: const Text('Go to THIRD'),
              onPressed: () => navigateToThird(),
            ),
          ],
        ),
      ),
    );
  }

  // 4- use sailor navigate
  void navigateToThird() {
    Routes.sailor.navigate(
      RoutePaths.ThirdPage,
      args: ThirdPageArgs(name: 'Sara', age: 17),
    );
  }

  // 4.1- use sailor navigate
  void navigateToSecond() {
    Routes.sailor.navigate(
      RoutePaths.secondPage,
      params: {'name': 'Sadra', 'age': 26},
      transitions: [
        SailorTransition.fade_in,
        SailorTransition.slide_from_left,
      ],
    );
  }
}

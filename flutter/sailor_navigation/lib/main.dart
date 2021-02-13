import 'package:flutter/material.dart';

import 'pages/initial_page.dart';
import 'routes.dart';

void main() {
  // 2- call createRoute before runApp
  Routes.createRoutes();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sailor Navigation',
      home: InitialPage(),
      // 3- setup sailor
      onGenerateRoute: Routes.sailor.generator(),
      navigatorKey: Routes.sailor.navigatorKey,
    );
  }
}

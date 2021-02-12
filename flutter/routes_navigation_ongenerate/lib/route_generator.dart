import 'package:flutter/material.dart';

import 'pages/first_page.dart';
import 'pages/second_page.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => FirstPage());
      case '/second':
        if (args is String) {
          return MaterialPageRoute(builder: (_) => SecondPage(data: args));
        }
        return _unknownRoute(message: "argument must be String");
      default:
        return _unknownRoute();
    }
  }

  static Route<dynamic> _unknownRoute({String message = 'Unknown Route'}) {
    return MaterialPageRoute(
        builder: (_) => _unknownRoutePage(message: message));
  }

  static Widget _unknownRoutePage({String message = 'Unknown Route'}) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Unknown Route"),
        backgroundColor: Colors.red,
      ),
      backgroundColor: Colors.red,
      body: Center(
        child: Text(
          message,
          style: TextStyle(
            fontSize: 33.0,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

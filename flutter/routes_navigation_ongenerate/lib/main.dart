import 'package:flutter/material.dart';
import 'package:routes_navigation_ongenerate/pages/first_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Routes & Navigation",
      home: FirstPage(),
    );
  }
}

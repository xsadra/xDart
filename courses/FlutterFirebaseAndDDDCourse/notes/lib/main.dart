import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:notes/injection.dart';

import 'presentation/core/app_widget.dart';

void main() {
  configureDependencies(env: Environment.prod);
  runApp(AppWidget());
}

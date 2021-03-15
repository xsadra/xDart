import 'package:flutter/material.dart';

//? Step 88: create [showSnackBar] in core
ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showSnackBar(
  BuildContext context, {
  @required String message,
  Duration duration,
}) {
  return Scaffold.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
      duration: duration ?? const Duration(seconds: 5),
    ),
  );
}

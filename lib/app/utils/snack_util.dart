import 'package:flutter/material.dart';

void showSnack({required BuildContext context, required String message, required Color color}) {
  ScaffoldMessenger.of(context).clearSnackBars();
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(message),
    duration: const Duration(seconds: 3),
    backgroundColor: color,
  ));
}

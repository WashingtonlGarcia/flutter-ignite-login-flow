import 'package:flutter/material.dart' show runApp;

import 'app/app_widget.dart';
import 'app/routes/routes.dart' show AppRoutes;

void main() {
  AppRoutes.defineRoutes();
  runApp(const AppWidget());
}

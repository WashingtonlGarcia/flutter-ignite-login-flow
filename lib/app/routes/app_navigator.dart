import 'package:flutter/material.dart' show GlobalKey, NavigatorState;

class AppNavigator {
  AppNavigator._();

  static GlobalKey<NavigatorState> key = GlobalKey<NavigatorState>();

  static Future<T?> push<T>({required String route, dynamic args}) => key.currentState!.pushNamed<T>(route, arguments: args);

  static void pop<T extends Object>({T? result}) => key.currentState!.pop<T?>(result);
}

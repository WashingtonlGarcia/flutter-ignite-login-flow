import 'package:flutter/material.dart';
import 'routes/routes.dart';

class CustomMaterialApp extends MaterialApp {
  CustomMaterialApp()
      : super(
          title: 'Login FLow',
          initialRoute: AppRouteName.login,
          navigatorKey: AppNavigator.key,
          onGenerateRoute: AppRoutes.router.generator,
        );
}

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomMaterialApp();
  }
}

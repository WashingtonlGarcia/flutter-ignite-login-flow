import 'package:firebase_core/firebase_core.dart';
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

  Future<void> initFirebase() async {
    await Firebase.initializeApp();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: initFirebase(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return CustomMaterialApp();
        } else {
          return Container();
        }
      },
    );
  }
}

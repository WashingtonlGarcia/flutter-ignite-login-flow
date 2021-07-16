import 'package:flutter/material.dart';
import 'package:flutter_ignite_login_flow/app/routes/app_navigator.dart';
import 'package:flutter_ignite_login_flow/app/routes/app_route_name.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => AppNavigator.push(route: AppRouteName.home),
      ),
      appBar: AppBar(
        title: const Text('Login'),
      ),
    );
  }
}

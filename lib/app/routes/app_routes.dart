import 'package:fluro/fluro.dart';
import 'package:flutter_ignite_login_flow/app/routes/app_route_name.dart';
import 'package:flutter_ignite_login_flow/app/routes/routes.dart';
import '../modules/login/login_view.dart';

class AppRoutes {
  AppRoutes._();

  static FluroRouter router = FluroRouter();

  static Handler loginHandler = Handler(
    handlerFunc: (context, parameters) => const LoginView(),
  );
  static Handler homeHandler = Handler(
    handlerFunc: (context, parameters) => const LoginView(),
  );

  static void defineRoutes() {
    router.notFoundHandler = loginHandler;
    router.define(AppRouteName.login, handler: loginHandler, transitionType: TransitionType.fadeIn);
    router.define(AppRouteName.home, handler: homeHandler, transitionType: TransitionType.fadeIn);
  }
}

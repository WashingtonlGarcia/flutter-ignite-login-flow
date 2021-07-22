import 'package:fluro/fluro.dart';

import 'app_handler.dart';
import 'app_route_name.dart';

class AppRoutes {
  AppRoutes._();

  static FluroRouter router = FluroRouter();

  static void defineRoutes() {
    router.notFoundHandler = AppHandler.loginHandler;
    router.define(AppRouteName.login, handler: AppHandler.loginHandler, transitionType: TransitionType.fadeIn);
    router.define(AppRouteName.home, handler: AppHandler.homeHandler, transitionType: TransitionType.fadeIn);
  }
}

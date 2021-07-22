import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/authentication/authentication_bloc.dart';
import '../data/repositories/authentication_repository.dart';

import '../views/home/home_view.dart';
import '../views/login/login_view.dart';

class AppHandler {
  AppHandler();

  static AuthenticationBloc authenticationBloc = AuthenticationBloc(repository: AuthenticationRepository(firebaseAuth: FirebaseAuth.instance));

  static Handler loginHandler = Handler(
    handlerFunc: (context, parameters) => BlocProvider<AuthenticationBloc>.value(value: authenticationBloc, child: LoginView()),
  );
  static Handler homeHandler = Handler(
    handlerFunc: (context, parameters) => BlocProvider<AuthenticationBloc>.value(value: authenticationBloc, child: const HomeView()),
  );
}

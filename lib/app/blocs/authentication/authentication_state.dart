part of 'authentication_bloc.dart';

abstract class AuthenticationState {}

class AuthenticationInitialState extends AuthenticationState {}

class AuthenticationLoadingState extends AuthenticationState {}

class AuthenticationSuccessState extends AuthenticationState {
  UserModel? user;

  AuthenticationSuccessState({this.user});
}

class AuthenticationSuccessSignOutState extends AuthenticationState {}

class AuthenticationFailureState extends AuthenticationState {
  String message;

  AuthenticationFailureState({required this.message});
}

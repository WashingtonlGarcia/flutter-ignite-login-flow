part of 'authentication_bloc.dart';

abstract class AuthenticationEvent {}

class AuthenticationSignInEvent extends AuthenticationEvent {
  final String email;
  final String password;

  AuthenticationSignInEvent({required this.email, required this.password});
}

class AuthenticationSignUpEvent extends AuthenticationEvent {
  final String email;
  final String password;

  AuthenticationSignUpEvent({required this.email, required this.password});
}

class AuthenticationSignOutEvent extends AuthenticationEvent {}

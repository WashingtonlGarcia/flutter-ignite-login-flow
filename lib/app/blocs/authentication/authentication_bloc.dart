import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/user_model.dart';
import '../../data/repositories/authentication_repository.dart';

part 'authentication_event.dart';

part 'authentication_state.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  final IAuthenticationRepository repository;

  AuthenticationBloc({required this.repository}) : super(AuthenticationInitialState());

  @override
  Stream<AuthenticationState> mapEventToState(AuthenticationEvent event) async* {
    switch (event.runtimeType) {
      case AuthenticationSignInEvent:
        event as AuthenticationSignInEvent;
        yield* signIn(event);
        break;
      case AuthenticationSignUpEvent:
        event as AuthenticationSignUpEvent;
        yield* signUp(event);
        break;
      case AuthenticationSignOutEvent:
        event as AuthenticationSignOutEvent;
        yield* signOut(event);
        break;
      default:
        yield AuthenticationInitialState();
    }
  }

  Stream<AuthenticationState> signIn(AuthenticationSignInEvent event) async* {
    yield AuthenticationLoadingState();
    final response = await repository.signIn(password: event.password, email: event.email);
    yield response.fold(
        (failure) => AuthenticationFailureState(message: failure.toString()), (data) => AuthenticationSuccessState(user: data as UserModel));
  }

  Stream<AuthenticationState> signUp(AuthenticationSignUpEvent event) async* {
    yield AuthenticationLoadingState();
    final response = await repository.signUp(password: event.password, email: event.email);
    yield response.fold(
        (failure) => AuthenticationFailureState(message: failure.toString()), (data) => AuthenticationSuccessState(user: data as UserModel));
  }

  Stream<AuthenticationState> signOut(AuthenticationSignOutEvent event) async* {
    yield AuthenticationLoadingState();
    final response = await repository.signOut();
    yield response.fold((failure) => AuthenticationFailureState(message: failure.toString()), (data) => AuthenticationSuccessSignOutState());
  }
}

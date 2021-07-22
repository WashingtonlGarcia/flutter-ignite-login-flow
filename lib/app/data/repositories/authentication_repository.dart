import 'package:firebase_auth/firebase_auth.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_ignite_login_flow/app/data/models/user_model.dart';
import '../errors/authentication_exception.dart';

abstract class IAuthenticationRepository<Failure, Data> {
  Future<Either<Failure, Data>> signIn({required String password, required String email});

  Future<Either<Failure, Data>> signUp({required String password, required String email});

  Future<Either<Failure, void>> signOut();
}

class AuthenticationRepository implements IAuthenticationRepository<AuthenticationException, UserModel> {
  final FirebaseAuth firebaseAuth;

  AuthenticationRepository({required this.firebaseAuth});

  @override
  Future<Either<AuthenticationException, UserModel>> signIn({required String password, required String email}) async {
    try {
      final UserCredential userCredential = await firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      return right(UserModel.fromFirebase(user: userCredential.user));
    } on FirebaseAuthException catch (error) {
      return left(AuthenticationFirebaseException(code: error.code));
    } catch (error) {
      return left(AuthenticationGenericException(message: error.toString()));
    }
  }

  @override
  Future<Either<AuthenticationException, UserModel>> signUp({required String password, required String email}) async {
    try {
      final UserCredential userCredential = await firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
      return right(UserModel.fromFirebase(user: userCredential.user));
    } on FirebaseAuthException catch (error) {
      return left(AuthenticationFirebaseException(code: error.code));
    } catch (error) {
      return left(AuthenticationGenericException(message: error.toString()));
    }
  }

  @override
  Future<Either<AuthenticationException, void>> signOut() async {
    try {
      return right(await firebaseAuth.signOut());
    } on FirebaseAuthException catch (error) {
      return left(AuthenticationFirebaseException(code: error.code));
    } catch (error) {
      return left(AuthenticationGenericException(message: error.toString()));
    }
  }
}

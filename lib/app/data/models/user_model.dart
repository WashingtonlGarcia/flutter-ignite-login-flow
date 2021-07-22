import 'package:firebase_auth/firebase_auth.dart';

class UserModel {
  final String? id;
  final String? email;
  final String? displayName;
  final String? photoURL;

  UserModel({this.id, this.email, this.photoURL, this.displayName});

  factory UserModel.fromFirebase({required User? user}) {
    return UserModel(email: user?.email, id: user?.uid, photoURL: user?.photoURL, displayName: user?.displayName);
  }
}

import 'dart:async';

import 'package:auth_repository/auth_repository.dart';
import 'package:auth_repository/src/data/auth_api_repository.dart';

import 'package:auth_repository/src/model/sign_in_response.dart';
import 'package:firebase_auth/firebase_auth.dart';

///
class AuthRepository {
  final _provider = AuthApiRepository();

  ///
  Future<AuthResponse> createUserWithEmailAndPassword(
    String email,
    String password,
  ) {
    return _provider.createUserWithEmailAndPassword(email, password);
  }

  ///
  Future<SignInResponse> signInWithEmailAndPassword(
    String email,
    String password,
  ) {
    return _provider.singInWithEmailAndPassword(email, password);
  }


  ///
  StreamController<bool> isUserLoggedOut() {
    return _provider.isUserLoggedOut();
  }

  ///
  bool signOut(String password) {
    return _provider.signOut();
  }

  ///
  User? getUser() {
    return _provider.getCurrentUser();
  }

}

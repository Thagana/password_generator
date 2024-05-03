import 'dart:async';

import 'package:auth_repository/src/model/auth_response.dart';
import 'package:auth_repository/src/model/sign_in_response.dart';
import 'package:firebase_auth/firebase_auth.dart';

///
class AuthApiRepository {
  ///
  Future<AuthResponse> createUserWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return AuthResponse(status: true);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return AuthResponse(
            status: false, message: 'The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        return AuthResponse(
            status: false,
            message: 'The account already exists for that email.');
      } else {
        return AuthResponse(status: false, message: e.message);
      }
    } catch (e) {
      return AuthResponse(status: false, message: e.toString());
    }
  }

  ///
  Future<SignInResponse> singInWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return SignInResponse(success: true, credentials: credential);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return const SignInResponse(success: false, message: 'User not found.');
      } else if (e.code == 'wrong-password') {
        return const SignInResponse(success: false, message: 'Wrong password.');
      } else {
        return SignInResponse(success: false, message: e.message);
      }
    } catch (e) {
      return SignInResponse(success: false, message: e.toString());
    }
  }

  ///
  StreamController<bool> isUserLoggedOut() {
    final controller = StreamController<bool>();

    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      controller.add(user == null);
    });

    controller.close();
    return controller;
  }

  ///
  bool signOut() {
    return true;
  }

  ///
  User? getCurrentUser() {
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        return user;
      } else {
        return null;
      }
    } catch (error) {
      throw Exception('Failed to get user');
    }
  }

}

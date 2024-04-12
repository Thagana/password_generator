import 'package:firebase_auth/firebase_auth.dart';

///
class SignInResponse {

  ///
  const SignInResponse({
    required this.success,
    this.message,
    this.credentials
});
  ///
  final bool success;

  ///
  final String? message;

  ///
  final UserCredential? credentials;
}
part of 'password_bloc.dart';

///
abstract class PasswordEvent {
  ///
  const PasswordEvent();
}

///
class RequestPasswords extends PasswordEvent {
  ///
  const RequestPasswords();
}

class RequestSavePassword extends PasswordEvent {
  const RequestSavePassword({required this.password, required this.strength});

  final String password;
  final PasswordStrength strength;
}

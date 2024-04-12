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
  const RequestSavePassword({required this.password});

  final String password;
}

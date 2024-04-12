import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

part 'login_form_state.dart';

class LoginFormCubit extends Cubit<LoginFormState> {
  LoginFormCubit() : super(LoginFormInitial());
  final _emailController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();
  final _loadingController = BehaviorSubject<bool>.seeded(false);

  String get emailValue {
    return _emailController.value;
  }

  String get passwordValue {
    return _passwordController.value;
  }

  // Stream
  Stream<String> get emailStream {
    return _emailController.stream;
  }

  Stream<String> get passwordStream {
    return _passwordController.stream;
  }

  Stream<bool> get loadingStream {
    return _loadingController.stream;
  }

  void updatePassword(String password) {
    if (password.length < 8) {
      _passwordController.sink
          .addError('Password is less than eight characters');
    } else {
      _passwordController.sink.add(password);
    }
  }

  void updateLoading() {
    _loadingController.sink.add(!_loadingController.stream.value);
  }

  bool isValidEmailAccount(String email) {
    return RegExp(r'^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$').hasMatch(
      email,
    );
  }

  void updateEmail(String email) {
    if (!isValidEmailAccount(email)) {
      _emailController.sink.addError('Email is not valid');
    } else {
      _emailController.sink.add(email);
    }
  }

  Stream<bool> get isValidForm {
    return Rx.combineLatest2(passwordStream, emailStream, (a, b) => true);
  }

  void dispose() {
    updateEmail('');
    updatePassword('');
  }
}

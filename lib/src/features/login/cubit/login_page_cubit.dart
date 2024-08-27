import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

part 'login_page_state.dart';

class LoginPageCubit extends Cubit<LoginPageState> {
  LoginPageCubit() : super(LoginPageInitial());
  final _formState = BehaviorSubject<String>.seeded('login');

  Stream<String> get formStateStream {
    return _formState.stream;
  }

  void updatePageState(String page) {
      _formState.sink.add(page);
  }

  void dispose() {
    updatePageState('');
  }

}

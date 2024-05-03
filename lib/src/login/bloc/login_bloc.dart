import 'dart:async';

import 'package:auth_repository/auth_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc({required this.authRepository}) : super(const LoginState()) {
    on<SignInRequest>(_signInWithEmailAndPassword);
  }

  final AuthRepository authRepository;

  Future<void> _signInWithEmailAndPassword(
    SignInRequest event,
    Emitter<LoginState> emit,
  ) async {
    try {
      final email = event.email;
      final password = event.password;
      emit(
        state.copyWith(loading: true),
      );
      final response =
          await authRepository.signInWithEmailAndPassword(email, password);
      if (response.success) {
        emit(
          state.copyWith(
            success: true,
            credentials: response.credentials,
            loading: false,
          ),
        );
      } else {
        emit(
          state.copyWith(
            success: false,
            errorMessage: response.message,
            loading: false,
          ),
        );
      }
    } catch (error) {
      if (kDebugMode) {
        print(error);
      }
      emit(
        state.copyWith(errorMessage: 'Something went wrong', loading: false),
      );
    }
  }
}

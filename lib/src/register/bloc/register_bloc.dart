import 'dart:async';

import 'package:auth_repository/auth_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

part 'register_event.dart';

part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc({required this.authRepository}) : super(const RegisterState()) {
    on<SignUpRequest>(_createUserWithEmailAndPassword);
  }

  final AuthRepository authRepository;

  Future<void> _createUserWithEmailAndPassword(
      SignUpRequest event,
      Emitter<RegisterState> emit,
      ) async {
    try {
      final email = event.email;
      final password = event.password;
      final response =
      await authRepository.createUserWithEmailAndPassword(email, password);
      if (response.status) {
        emit(state.copyWith(success: true));
      } else {
        emit(state.copyWith(errorMessage: response.message, success: false));
      }
    } catch (error) {
      if (kDebugMode) {
        print(error);
      }
      emit(state.copyWith(errorMessage: 'Something went wrong'));
    }
  }

}

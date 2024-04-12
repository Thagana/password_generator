import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';
import 'package:password_repository/password_repository.dart';

part 'password_event.dart';
part 'password_state.dart';

///
class PasswordBloc extends Bloc<PasswordEvent, PasswordState> {
  ///
  PasswordBloc({required this.passwordRepository})
      : super(const PasswordState()) {
    on<RequestSavePassword>(_requestSavePassword);
    on<RequestPasswords>(_requestPasswords);
  }

  ///
  final PasswordRepository passwordRepository;

  String getTodayDate() {
    final now = DateTime.now();
    final formatter = DateFormat('yyyy/MM/dd');
    final formattedDate = formatter.format(now);
    return formattedDate;
  }

  ///
  Future<void> _requestSavePassword(
    RequestSavePassword event,
    Emitter<PasswordState> emit,
  ) async {
    try {
      final date = getTodayDate();
      await passwordRepository.savePassword(event.password, date);
      final passwords = await passwordRepository.getPasswords();
      emit(state.copyWith(success: true, passwords: passwords));
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      emit(
        state.copyWith(
          success: false,
          errorMessage: 'Failed to fetch passwords',
        ),
      );
    }
  }

  Future<void> _requestPasswords(
    RequestPasswords event,
    Emitter<PasswordState> emit,
  ) async {
    try {
      final passwords = await passwordRepository.getPasswords();
      emit(state.copyWith(passwords: passwords, success: true));
    } catch (error) {
      if (kDebugMode) {
        print(error);
      }
      emit(
        state.copyWith(errorMessage: 'Failed to save password', success: false),
      );
    }
  }
}

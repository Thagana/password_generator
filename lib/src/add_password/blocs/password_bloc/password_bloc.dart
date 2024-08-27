import 'package:bloc/bloc.dart';
import 'package:cyberman/src/home/cubit/password_cubit.dart';
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

  int getStrength(PasswordStrength strength) {
    if (strength == PasswordStrength.STRONG) {
      return 10;
    }
    if (strength == PasswordStrength.MEDIUM) {
      return 5;
    }
    return 1;
  }

  ///
  Future<void> _requestSavePassword(
    RequestSavePassword event,
    Emitter<PasswordState> emit,
  ) async {
    try {
      final date = getTodayDate();
      const name = 'Unknown';
      const logo =
          'https://avatars.githubusercontent.com/u/68122202?s=400&u=4abc9827a8ca8b9c19b06b9c5c7643c87da51e10&v=4';
      final strength = getStrength(event.strength);
      await passwordRepository.savePassword(
        event.password,
        date,
        name,
        logo,
        strength,
      );
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

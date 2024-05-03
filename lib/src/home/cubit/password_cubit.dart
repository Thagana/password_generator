import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rxdart/rxdart.dart';

part 'password_state.dart';

enum PasswordStrength {
  WEEK,
  MEDIUM,
  STRONG,
}

class PasswordCubit extends Cubit<PasswordCubitState> {
  PasswordCubit() : super(PasswordInitial());

  // BehaviorSubject
  final _passwordController = BehaviorSubject<String>.seeded('CDnE6BXZtFGbAEt');

  final _passwordStrength =
      BehaviorSubject<PasswordStrength>.seeded(PasswordStrength.WEEK);

  // length option
  final _passwordLengthController = BehaviorSubject<double>.seeded(8);

  // Checkbox options
  final _isUpperCaseController = BehaviorSubject<bool>.seeded(true);
  final _isLowerCaseController = BehaviorSubject<bool>.seeded(true);
  final _isNumericController = BehaviorSubject<bool>.seeded(true);
  final _isSymbolController = BehaviorSubject<bool>.seeded(false);

  String get passwordValue => _passwordController.value;

  Stream<String> get passwordStream {
    return _passwordController.stream;
  }

  Stream<PasswordStrength> get passwordStrengthStream {
    return _passwordStrength.stream;
  }

  Stream<double> get passwordLengthStream {
    return _passwordLengthController.stream;
  }

  Stream<bool> get isUpperCaseOptionStream {
    return _isUpperCaseController.stream;
  }

  Stream<bool> get isLowerCaseOptionStream {
    return _isLowerCaseController.stream;
  }

  Stream<bool> get isSymbolOptionStream {
    return _isSymbolController.stream;
  }

  Stream<bool> get isNumberOptionStream {
    return _isNumericController.stream;
  }

  void updatePasswordLength(double value) {
    _passwordLengthController.sink.add(value);
  }

  void calculatePasswordStrength() {
    final password = _passwordController.value;
    final passwordLength = _passwordLengthController.value;
    var strength = PasswordStrength.WEEK;
    if (passwordLength < 8) {
      strength = PasswordStrength.WEEK;
    }
    // Complexity check
    final hasUppercase = password.contains(RegExp(r'[A-Z]'));
    final hasLowercase = password.contains(RegExp(r'[a-z]'));
    final hasDigit = password.contains(RegExp(r'[0-9]'));
    final hasSpecialChar =
        password.contains(RegExp(r'[!@#\$%^&*()\-_=+{};:,<.>/?\[\]\\]'));

    if (hasUppercase && hasLowercase && hasDigit && hasSpecialChar) {
      strength = PasswordStrength.STRONG;
    } else if ((hasUppercase || hasLowercase) && hasDigit) {
      strength = PasswordStrength.MEDIUM;
    } else {
      strength = PasswordStrength.WEEK;
    }
    _passwordStrength.sink.add(strength);
  }

  void updateIsUpperCaseOption(bool? value) {
    if (value != null) {
      _isUpperCaseController.sink.add(value);
    } else {
      _isUpperCaseController.sink.add(false);
    }
  }

  void updateIsLowerCaseOption(bool? value) {
    if (value != null) {
      _isLowerCaseController.sink.add(value);
    } else {
      _isLowerCaseController.sink.add(false);
    }
  }

  void updateIsNumericOption(bool? value) {
    if (value != null) {
      _isNumericController.sink.add(value);
    } else {
      _isNumericController.sink.add(false);
    }
  }

  void updateIsSymbolOption(bool? value) {
    if (value != null) {
      _isSymbolController.sink.add(value);
    } else {
      _isSymbolController.sink.add(false);
    }
  }

  void updatePassword() {
    final passwordLength = _passwordLengthController.value;
    final isSymbol = _isSymbolController.value;
    final isUpperCase = _isUpperCaseController.value;
    final isLowerCase = _isLowerCaseController.value;
    final isNumeric = _isNumericController.value;

    // sample
    const alphaLower = 'abcdefghijklmnopqrstuvwxyz';
    const alphaUpper = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    const numeric = '0123456789';
    const symbol = r'!@#$%^&*()';

    var password = '';

    final chars =
        "${isSymbol ? symbol : ''}${isUpperCase ? alphaUpper : ''}${isLowerCase ? alphaLower : ''}${isNumeric ? numeric : ''}";

    final random = Random.secure();

    for (var i = 0; i < passwordLength; i++) {
      final index = random.nextInt(chars.length);
      password += chars[index];
    }
    _passwordController.sink.add(password);
    calculatePasswordStrength();
  }

  void dispose() {
    updatePassword();
  }

  @override
  Future<void> close() async {
    await _passwordController.close();
    await _passwordLengthController.close();
    await _isNumericController.close();
    await _isLowerCaseController.close();
    await _isSymbolController.close();
    await _isUpperCaseController.close();
  }
}

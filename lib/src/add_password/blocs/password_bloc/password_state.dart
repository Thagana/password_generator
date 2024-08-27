part of 'password_bloc.dart';

///
class PasswordState {
  const PasswordState({
    this.passwords = const [],
    this.errorMessage = '',
    this.success = false,
  });

  final bool success;
  final List<Password> passwords;
  final String errorMessage;

  @override
  List<Object> get props => [errorMessage, passwords, success];

  PasswordState copyWith({
    List<Password>? passwords,
    String? errorMessage,
    bool? success,
  }) {
    return PasswordState(
      passwords: passwords ?? this.passwords,
      errorMessage: errorMessage ?? this.errorMessage,
      success: success ?? this.success,
    );
  }
}

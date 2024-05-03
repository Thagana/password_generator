part of 'login_bloc.dart';

class LoginState extends Equatable {
  const LoginState({
    this.errorMessage = '',
    this.success = false,
    this.loading = false,
    this.credentials,
  });

  final String errorMessage;
  final bool success;
  final bool loading;
  final UserCredential? credentials;

  LoginState copyWith({
    String? errorMessage,
    bool? success,
    UserCredential? credentials,
    bool? loading,
  }) {
    return LoginState(
        errorMessage: errorMessage ?? this.errorMessage,
        success: success ?? this.success,
        credentials: credentials ?? this.credentials,
        loading: loading ?? this.loading);
  }

  @override
  List<Object?> get props => [errorMessage, success, credentials, loading];
}

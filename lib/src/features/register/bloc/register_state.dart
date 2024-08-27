part of 'register_bloc.dart';

class RegisterState extends Equatable {
  const RegisterState({
    this.errorMessage = '',
    this.loading = false,
    this.success = false,
  });

  final String errorMessage;
  final bool success;
  final bool loading;

  RegisterState copyWith({
    String? errorMessage,
    bool? success,
    bool? loading
  }) {
    return RegisterState(
      loading: loading ?? this.loading,
      errorMessage: errorMessage ?? this.errorMessage,
      success: success ?? this.success,
    );
  }

  @override
  List<Object?> get props => [errorMessage, success];
}

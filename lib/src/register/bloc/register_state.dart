part of 'register_bloc.dart';

class RegisterState extends Equatable {
  const RegisterState({
    this.errorMessage = '',
    this.success = false,
  });

  final String errorMessage;
  final bool success;

  RegisterState copyWith({
    String? errorMessage,
    bool? success,
  }) {
    return RegisterState(
      errorMessage: errorMessage ?? this.errorMessage,
      success: success ?? this.success,
    );
  }

  @override
  List<Object?> get props => [errorMessage, success];
}

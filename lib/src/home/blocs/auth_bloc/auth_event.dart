part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {
  const AuthEvent();

  @override
  List<Object?> get props => [];
}

class RequestUserEvent extends AuthEvent {
  const RequestUserEvent();
  @override
  List<Object?> get props => [];
}

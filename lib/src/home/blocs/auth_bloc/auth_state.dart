part of 'auth_bloc.dart';

class AuthState {
  const AuthState({this.user});

  final User? user;

  AuthState copyWith({User? user}) {
    return AuthState(user: user ?? this.user);
  }
}

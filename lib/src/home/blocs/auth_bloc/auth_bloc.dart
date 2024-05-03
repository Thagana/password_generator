import 'package:auth_repository/auth_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc({required this.authRepository}) : super(const AuthState()) {
    on<RequestUserEvent>((event, emit) {
      final user = authRepository.getUser();
      emit(
        state.copyWith(
          user: user,
        ),
      );
    });
  }

  final AuthRepository authRepository;
}

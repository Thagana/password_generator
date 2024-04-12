import 'package:auth_repository/auth_repository.dart';
import 'package:cyberman/router/router.dart';
import 'package:cyberman/src/home/blocs/auth_bloc/auth_bloc.dart';
import 'package:cyberman/src/home/blocs/password_bloc/password_bloc.dart';
import 'package:cyberman/src/login/bloc/login_bloc.dart';
import 'package:cyberman/src/login/cubit/login_page_cubit.dart';
import 'package:cyberman/src/register/bloc/register_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:password_repository/password_repository.dart';

class App extends StatelessWidget {
  App({super.key});

  final AppRouter appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    final passwordRepository = PasswordRepository();
    final authRepository = AuthRepository();
    return MultiRepositoryProvider(
      providers: [RepositoryProvider(create: (context) => passwordRepository)],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<PasswordBloc>(
            create: (context) =>
                PasswordBloc(passwordRepository: passwordRepository)
                ..add(const RequestPasswords())
            ,
          ),
          BlocProvider(create: (context) => LoginPageCubit()),
          BlocProvider(
            create: (context) => AuthBloc(authRepository: authRepository),
          ),
          BlocProvider(
            create: (context) => RegisterBloc(authRepository: authRepository),
          ),
          BlocProvider(
            create: (context) => LoginBloc(authRepository: authRepository),
          ),
        ],
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: 'Cyberman',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          routerConfig: appRouter.router,
        ),
      ),
    );
  }
}

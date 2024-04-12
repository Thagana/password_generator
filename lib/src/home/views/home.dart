import 'package:cyberman/src/home/cubit/password_cubit.dart';
import 'package:cyberman/src/home/home.dart';
import 'package:cyberman/src/login/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data != null) {
              return BlocProvider<PasswordCubit>(
                create: (context) => PasswordCubit(),
                child: kIsWeb ? const WebHome() : const HomeApp(),
              );
            } else {
              return const LoginPage();
            }
          } else {
            return const LoginPage();
          }
        });
  }
}

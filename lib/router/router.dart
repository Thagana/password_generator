import 'package:cyberman/src/home/home.dart';
import 'package:cyberman/src/login/views/login_page.dart';
import 'package:cyberman/src/register/views/register_page.dart';
import 'package:cyberman/src/view_more/views/view_more_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  final GoRouter _router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(path: '/login', builder: (context, state) => const LoginPage()),
      GoRoute(
          path: '/register', builder: (context, state) => const RegisterPage()),
      GoRoute(
        path: '/view_more',
        builder: (context, state) => const ViewMorePage(),
      ),
    ],
    // redirect: (BuildContext context, GoRouterState state) {
    //   if (AuthState.of(context).isSignedIn) {
    //     return '/signin';
    //   } else {
    //     return null;
    //   }
    // },
  );

  GoRouter get router => _router;
}

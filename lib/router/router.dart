import 'package:cyberman/src/home/blocs/auth_bloc/auth_bloc.dart';
import 'package:cyberman/src/home/home.dart';
import 'package:cyberman/src/login/views/login_page.dart';
import 'package:cyberman/src/profile/views/profile_page.dart';
import 'package:cyberman/src/register/views/register_page.dart';
import 'package:cyberman/src/root/navigation_root.dart';
import 'package:cyberman/src/view_more/views/view_more_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');


class AppRouter {
  final GoRouter _router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/',
    errorBuilder: (context, state) {
      return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '${state.error}',
                textAlign: TextAlign.center,
              ),
              ElevatedButton(
                onPressed: () {
                  context.goNamed('home');
                },
                child: const Text('Go Home'),
              ),
            ],
          ),
        ),
      );
    },
    routes: <RouteBase>[
      GoRoute(path: '/login', builder: (context, state) => const LoginPage()),
      GoRoute(
        path: '/register',
        builder: (context, state) => const RegisterPage(),
      ),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return ScaffoldWithNavbar(navigationShell);
        },
        branches: <StatefulShellBranch>[
          StatefulShellBranch(
            routes: <RouteBase>[
              GoRoute(
                path: '/',
                name: 'home',
                builder: (context, state) => const HomePage(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: <RouteBase>[
              GoRoute(
                path: '/passwords',
                name: 'passwords',
                builder: (context, state) => const ViewMorePage(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: <RouteBase>[
              GoRoute(
                path: '/profile',
                name: 'profile',
                builder: (context, state) => const ProfilePage(),
              ),
            ],
          ),
        ],
      ),
    ],
    redirect: (BuildContext context, GoRouterState state) {
      if (state.fullPath == '/register' || state.fullPath == '/login') {
        return null;
      }

      final user = context.read<AuthBloc>().authRepository.getUser();

      if (user?.uid == null) {
        return '/login';
      }

      return null;
    },
  );

  GoRouter get router => _router;
}

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:fokusin_app1/screens/splash/splash_screen.dart';
import 'package:fokusin_app1/screens/splash/splash_cream_screen.dart';

import 'package:fokusin_app1/screens/onboarding/onboarding_screen.dart';

import 'package:fokusin_app1/screens/auth/login_screen.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/',

  routes: <RouteBase>[
    // ───────── SPLASH SCREEN ─────────
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const SplashScreen();
      },
    ),

    // ───────── SPLASH CREAM SCREEN ─────────
    GoRoute(
      path: '/splash-cream',
      pageBuilder: (BuildContext context, GoRouterState state) {
        return CustomTransitionPage<void>(
          key: state.pageKey,

          child: const SplashCreamScreen(),

          transitionsBuilder:
              (_, Animation<double> animation, __, Widget child) {
                return FadeTransition(opacity: animation, child: child);
              },

          transitionDuration: const Duration(milliseconds: 500),
        );
      },
    ),

    // ───────── ONBOARDING ─────────
    GoRoute(
      path: '/onboarding',
      pageBuilder: (BuildContext context, GoRouterState state) {
        return CustomTransitionPage<void>(
          key: state.pageKey,

          child: const OnboardingScreen(),

          transitionsBuilder:
              (_, Animation<double> animation, __, Widget child) {
                return FadeTransition(opacity: animation, child: child);
              },

          transitionDuration: const Duration(milliseconds: 400),
        );
      },
    ),

    // ───────── LOGIN ─────────
    GoRoute(
      path: '/login',
      pageBuilder: (BuildContext context, GoRouterState state) {
        return CustomTransitionPage<void>(
          key: state.pageKey,

          child: const LoginScreen(),

          transitionsBuilder:
              (_, Animation<double> animation, __, Widget child) {
                return FadeTransition(opacity: animation, child: child);
              },

          transitionDuration: const Duration(milliseconds: 400),
        );
      },
    ),

    // ───────── HOME ─────────
    GoRoute(
      path: '/home',
      builder: (BuildContext context, GoRouterState state) {
        return const _PlaceholderHome();
      },
    ),
  ],
);

/// HOME SEMENTARA
class _PlaceholderHome extends StatelessWidget {
  const _PlaceholderHome();

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFFFFF8E4),

      body: Center(
        child: Text(
          'Home Page',
          style: TextStyle(
            fontSize: 24,
            color: Color(0xFF1A1A2E),
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// --- Imports Screen ---
import 'package:fokusin_app1/screens/splash/splash_screen.dart';
import 'package:fokusin_app1/screens/splash/splash_cream_screen.dart';
import 'package:fokusin_app1/screens/onboarding/onboarding_screen.dart';
import 'package:fokusin_app1/screens/auth/login_screen.dart';
import 'package:fokusin_app1/screens/auth/register_screen.dart';
import 'package:fokusin_app1/screens/home/home_screen.dart'; // <-- Import HomeScreen yang baru ditambahkan

final GoRouter appRouter = GoRouter(
  initialLocation:
      '/', // Ubah ke '/home' jika kamu ingin langsung testing halaman Home pas aplikasi dibuka

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

    // ───────── REGISTER ─────────
    GoRoute(
      path: '/register',
      pageBuilder: (BuildContext context, GoRouterState state) {
        return CustomTransitionPage<void>(
          key: state.pageKey,
          child: const RegisterScreen(),
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
      pageBuilder: (BuildContext context, GoRouterState state) {
        return CustomTransitionPage<void>(
          key: state.pageKey,
          child: const HomeScreen(), // <-- Memanggil HomeScreen asli di sini
          transitionsBuilder:
              (_, Animation<double> animation, __, Widget child) {
                return FadeTransition(opacity: animation, child: child);
              },
          transitionDuration: const Duration(milliseconds: 400),
        );
      },
    ),
  ],
);

// Note: Class _PlaceholderHome sudah dihapus karena kita sudah punya HomeScreen aslinya!

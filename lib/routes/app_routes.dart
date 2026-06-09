import 'package:flutter/material.dart';
import 'package:fokusin_app1/screens/kategori/kelola_kategori_page.dart';
import 'package:fokusin_app1/screens/kategori/list_kategori.dart';
import 'package:go_router/go_router.dart';

// --- Imports Screen ---
import 'package:fokusin_app1/screens/splash/splash_screen.dart';
import 'package:fokusin_app1/screens/splash/splash_cream_screen.dart';
import 'package:fokusin_app1/screens/onboarding/onboarding_screen.dart';
import 'package:fokusin_app1/screens/auth/login_screen.dart';
import 'package:fokusin_app1/screens/auth/register_screen.dart';
import 'package:fokusin_app1/screens/home/home_screen.dart';
import 'package:fokusin_app1/screens/profile/profile_screen.dart'; 

// 👇 TAMBAHKAN IMPORT UNTUK KATEGORI DAN PROGRESS DI SINI
// (Sesuaikan path-nya jika folder/file kamu berbeda)
import 'package:fokusin_app1/screens/progress/progress_screen.dart';

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
          child: const HomeScreen(),
          transitionsBuilder:
              (_, Animation<double> animation, __, Widget child) {
                return FadeTransition(opacity: animation, child: child);
              },
          transitionDuration: const Duration(milliseconds: 400),
        );
      },
    ),

    // ───────── PROFILE ─────────
    GoRoute(
      path: '/profile',
      pageBuilder: (BuildContext context, GoRouterState state) {
        return CustomTransitionPage<void>(
          key: state.pageKey,
          child: const ProfileScreen(), 
          transitionsBuilder:
              (_, Animation<double> animation, __, Widget child) {
                return FadeTransition(opacity: animation, child: child);
              },
          transitionDuration: const Duration(milliseconds: 400),
        );
      },
    ),

    // ───────── KATEGORI ─────────
    // Route baru untuk halaman List Kategori
    GoRoute(
      path: '/kategori',
      pageBuilder: (BuildContext context, GoRouterState state) {
        return CustomTransitionPage<void>(
          key: state.pageKey,
          child: const KelolaKategoriPage(), // <-- Arahkan ke file kategori_screen.dart
          transitionsBuilder:
              (_, Animation<double> animation, __, Widget child) {
                return FadeTransition(opacity: animation, child: child);
              },
          transitionDuration: const Duration(milliseconds: 400),
        );
      },
    ),

    // ───────── PROGRESS ─────────
    // Route baru untuk halaman Progres Ku
    GoRoute(
      path: '/progress',
      pageBuilder: (BuildContext context, GoRouterState state) {
        return CustomTransitionPage<void>(
          key: state.pageKey,
          child: const ProgressScreen(), // <-- Arahkan ke file progress_screen.dart
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
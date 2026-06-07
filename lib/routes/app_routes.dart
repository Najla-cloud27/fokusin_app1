import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// --- Imports Screen ---
// Di sini aku import semua screen yang dibutuhin buat navigasi antar halaman.
import 'package:fokusin_app1/screens/splash/splash_screen.dart';
import 'package:fokusin_app1/screens/splash/splash_cream_screen.dart';
import 'package:fokusin_app1/screens/onboarding/onboarding_screen.dart';
import 'package:fokusin_app1/screens/auth/login_screen.dart';
import 'package:fokusin_app1/screens/auth/register_screen.dart';
import 'package:fokusin_app1/screens/home/home_screen.dart';
import 'package:fokusin_app1/screens/profile/profile_screen.dart'; // <-- Aku tambahin import untuk ProfileScreen yang baru dibikin

final GoRouter appRouter = GoRouter(
  // Ini nentuin halaman pertama yang muncul pas aplikasi dibuka. Sekarang di-set ke Splash Screen ('/')
  initialLocation: '/',

  routes: <RouteBase>[
    // ───────── SPLASH SCREEN ─────────
    // Route ini buat nampilin logo awal banget pas aplikasi baru on.
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const SplashScreen();
      },
    ),

    // ───────── SPLASH CREAM SCREEN ─────────
    // Aku pakai CustomTransitionPage dan FadeTransition di sini biar perpindahan dari splash awal ke splash cream ada efek halus (fade) selama 500ms.
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
    // Nyambungin user ke halaman panduan awal (onboarding) sebelum mereka login atau register.
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
    // Route buat masuk ke akun. Nanti kalau aku klik tombol 'Keluar' yang warna merah di dialog logout, aplikasinya bakal otomatis diarahkan balik ke '/login' ini pakai perintah context.go('/login').
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
    // Route ini buat user yang belum punya akun dan mau daftar. Nyambungnya dari text "Belum punya akun?" di halaman Login.
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
    // Ini halaman utama aplikasi Fokusin. Nanti di dalam HomeScreen, aku tinggal panggil context.push('/profile') pas icon foto profil di klik biar masuk ke pengaturan profil.
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
    // Aku tambahin route '/profile' ini buat nampilin halaman profil yang baru. Pakai efek fade juga biar transisinya senada sama halaman lain. Kalau dari sini mau balik ke Home, tinggal klik tombol panah "Back" (context.pop()).
    GoRoute(
      path: '/profile',
      pageBuilder: (BuildContext context, GoRouterState state) {
        return CustomTransitionPage<void>(
          key: state.pageKey,
          child:
              const ProfileScreen(), // <-- Ini ngarah ke file profile_screen.dart yang baru dibuat
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

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:fokusin_app1/screens/splash_screen.dart';

// ─────────────────────────────────────────────────────────────────────────────
// lib/routes/app_routes.dart
// ─────────────────────────────────────────────────────────────────────────────

final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(path: '/', builder: (context, state) => const SplashScreen()),
    GoRoute(
      path: '/home',
      builder: (context, state) => const PlaceholderHome(),
    ),
    // Tambah route lain di sini nanti:
    // GoRoute(path: '/login', builder: (_, __) => const LoginScreen()),
  ],
);

// Ganti ini dengan HomePage asli kamu nanti
class PlaceholderHome extends StatelessWidget {
  const PlaceholderHome({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFF229EFF),
      body: Center(
        child: Text(
          'Home Page',
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

class SplashCreamScreen extends StatefulWidget {
  const SplashCreamScreen({super.key});
  @override
  State<SplashCreamScreen> createState() => _SplashCreamScreenState();
}

class _SplashCreamScreenState extends State<SplashCreamScreen> {
  static const Color _cream = Color(0xFFFFF8E4);

  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: _cream,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
    );
    _navigate();
  }

  Future<void> _navigate() async {
    await Future.delayed(const Duration(milliseconds: 700));
    if (mounted) context.go('/onboarding');
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(backgroundColor: _cream, body: SizedBox.shrink());
  }
}

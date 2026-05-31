// ─────────────────────────────────────────────────────────────────────────────
// lib/core/constants/app_colors.dart
// Color palette sesuai Figma design Fokusin
// ─────────────────────────────────────────────────────────────────────────────

import 'package:flutter/material.dart';

class AppColors {
  // tidak bisa di-instansiasi
  AppColors._();

  // ── Brand / Primary
  /// Warna utama aplikasi — background splash screen
  static const Color primary = Color(0xFF229EFF);

  // ── Blue Palette (dari Figma Color Palette Blue)
  // paling terang
  static const Color blue100 = Color(0xFFD6EEFF);
  static const Color blue200 = Color(0xFFADD6FF);
  static const Color blue300 = Color(0xFF7BBFFF);
  static const Color blue400 = Color(0xFF229EFF); // primary / splash bg ← ini
  static const Color blue500 = Color(0xFF1A7FD4);
  static const Color blue600 = Color(0xFF1565C0); // lebih gelap
  static const Color blue700 = Color(0xFF0D47A1); // paling gelap

  // ── Grey Palette (dari Figma Color Palette Grey)
  static const Color grey100 = Color(0xFFF5F5F5); // paling terang
  static const Color grey200 = Color(0xFFE0E0E0);
  static const Color grey300 = Color(0xFFBDBDBD);
  static const Color grey400 = Color(0xFF9E9E9E);
  static const Color grey500 = Color(0xFF757575);
  static const Color grey600 = Color(0xFF616161);
  static const Color grey700 = Color(0xFF212121); // paling gelap / hampir hitam

  // ── Yellow Palette (dari Figma Color Palette Yellow)
  static const Color yellow100 = Color(0xFFFFF9C4); // paling terang
  static const Color yellow200 = Color(0xFFFFF176);
  static const Color yellow300 = Color(0xFFFFEE58);
  static const Color yellow400 = Color(0xFFFFD600); // kuning cerah
  static const Color yellow500 = Color(0xFFFFC107); // amber
  static const Color yellow600 = Color(0xFFFFB300);
  static const Color yellow700 = Color(0xFF827717); // paling gelap / olive

  // ── Semantic / Utility
  static const Color white = Colors.white;
  static const Color black = Colors.black;
  static const Color transparent = Colors.transparent;

  static const Color success = Color(0xFF4CAF50);
  static const Color warning = Color(0xFFFF9800);
  static const Color error = Color(0xFFF44336);
  static const Color info = blue400;

  // ── Text
  static const Color textPrimary = grey700;
  static const Color textSecondary = grey500;
  static const Color textHint = grey400;
  // teks di atas background biru
  static const Color textOnPrimary = white;
}

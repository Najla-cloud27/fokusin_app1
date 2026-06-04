import 'dart:math' as math;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fokusin_app1/screens/auth/google_auth_popup.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fokusin_app1/core/constants/asset_paths.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  static const Color _bgColor = Color(0xFFFFF8E4);
  static const Color _blue = Color(0xFF2F9BF4);
  static const Color _dark = Color(0xFF1A1A2E);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _bgColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // ================= COMPONENT ILUSTRASI =================
            const _AuthIllustrationHeader(),

            const SizedBox(height: 20),

            // ================= BAGIAN FORM & BUTTON =================
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Teks Judul
                  Text(
                    'Daftar untuk Fokusin',
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: _dark,
                    ),
                    textAlign: TextAlign.left,
                  ),

                  const SizedBox(height: 24),

                  // TEXTFIELD EMAIL
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        34,
                      ), // Disesuaikan agar tetap bulat sempurna
                      border: Border.all(
                        color: const Color(0xFF7AC5FF),
                        width:
                            4.0, // 👈 Dinaikkan ke 4.0 supaya tebal & kelihatan jelas seperti di Figma
                      ),
                    ),
                    padding: const EdgeInsets.all(
                      4,
                    ), // 👈 Dinaikkan ke 4 biar jarak gap-nya pas
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFFE3F2FD),
                        borderRadius: BorderRadius.circular(28),
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Email Anda',
                          hintStyle: GoogleFonts.poppins(
                            color: const Color(0xFF929292),
                            fontSize: 14,
                          ),
                          border: InputBorder.none,
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 22,
                            vertical: 14,
                          ),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 16),

                  // TEXTFIELD PASSWORD
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(34),
                      border: Border.all(
                        color: const Color(0xFF7AC5FF),
                        width: 4.0, // 👈 Dinaikkan ke 4.0 juga agar seimbang
                      ),
                    ),
                    padding: const EdgeInsets.all(4),
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFFE3F2FD),
                        borderRadius: BorderRadius.circular(28),
                      ),
                      child: TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: 'Masukkan Password Anda',
                          hintStyle: GoogleFonts.poppins(
                            color: const Color(0xFF929292),
                            fontSize: 14,
                          ),
                          border: InputBorder.none,
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 22,
                            vertical: 14,
                          ),
                        ),
                      ),
                    ),
                  ),

                  // Note: Teks "Forgot Password" dihapus karena di design Figma Register tidak ada
                  const SizedBox(height: 32),

                  // ================= TOMBOL DAFTAR =================
                  Container(
                    height: 58,
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(36),
                      border: Border.all(
                        color: const Color(0xFF8FD0FF),
                        width: 4,
                      ),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        color: _blue,
                        borderRadius: BorderRadius.circular(32),
                      ),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(32),
                          onTap: () {},
                          child: Center(
                            child: Text(
                              'Daftar', // 👈 Teks diubah dari Login menjadi Daftar
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 36),

                  // ================= LINK PINDAH KE LOGIN =================
                  Center(
                    child: RichText(
                      text: TextSpan(
                        text: 'Sudah punya akun? ',
                        style: GoogleFonts.poppins(
                          color: _dark,
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                        children: [
                          TextSpan(
                            text: 'Masuk',
                            style: GoogleFonts.poppins(
                              color: _blue,
                              fontWeight: FontWeight.w700,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                // Kembali ke halaman Login screen sebelumnya
                                Navigator.pop(context);
                              },
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 60),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ================= WIDGET ILUSTRASI HEADER =================
class _AuthIllustrationHeader extends StatelessWidget {
  const _AuthIllustrationHeader();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    if (screenWidth > 450) {
      screenWidth = 450;
    }

    final double scale = screenWidth / 390;

    final double logoWidth = 285 * scale;
    final double logoHeight = 327 * scale;
    final double logoTop = 49 * scale;
    final double logoLeft = 56 * scale;

    final double cloud1Width = 250 * scale;
    final double cloud1Height = 250 * scale;
    final double cloud1Left = -43 * scale;

    final double cloud2Width = 250 * scale;
    final double cloud2Height = 250 * scale;
    final double cloud2Left = 101 * scale;

    final double cloud3Width = 175 * scale;
    final double cloud3Height = 175 * scale;
    final double cloud3Left = 283 * scale;

    final double cloud1Top = 192 * scale;
    final double cloud2Top = 182 * scale;
    final double cloud3Top = 220 * scale;

    final double headerHeight = 380 * scale;

    return Center(
      child: SizedBox(
        width: screenWidth,
        height: headerHeight,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
              top: logoTop,
              left: logoLeft,
              child: Image.asset(
                AssetPaths.loginCharacter,
                width: logoWidth,
                height: logoHeight,
                fit: BoxFit.contain,
              ),
            ),
            Positioned(
              top: cloud1Top,
              left: cloud1Left,
              child: Opacity(
                opacity: 0.90,
                child: Image.asset(
                  AssetPaths.loginCloud1,
                  width: cloud1Width,
                  height: cloud1Height,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Positioned(
              top: cloud3Top,
              left: cloud3Left,
              child: Opacity(
                opacity: 0.90,
                child: Transform.rotate(
                  angle: -180 * math.pi / 180,
                  child: Image.asset(
                    AssetPaths.loginCloud3,
                    width: cloud3Width,
                    height: cloud3Height,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            Positioned(
              top: cloud2Top,
              left: cloud2Left,
              child: Opacity(
                opacity: 0.90,
                child: Image.asset(
                  AssetPaths.loginCloud2,
                  width: cloud2Width,
                  height: cloud2Height,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fokusin_app1/core/constants/asset_paths.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  static const Color _bgColor = Color(0xFFFFF8E4);
  static const Color _blue = Color(0xFF2F9BF4);
  static const Color _dark = Color(0xFF1A1A2E);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _bgColor,
      body: SafeArea(
        child: Column(
          children: [
            // Spacer ini yang bertugas menaikkan KESELURUHAN ilustrasi (Karakter + Awan) ke atas
            const Spacer(flex: 1),

            // ================= KOTAK ILUSTRASI (KARAKTER + AWAN) =================
            Center(
              child: SizedBox(
                width: 393,
                height: 380,
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    // 1. KARAKTER UTAMA
                    Positioned(
                      top:
                          0, // KEMBALIKAN KE 0: Agar awan menutupi piring dan kaki dengan pas!
                      left: (393 - 235) / 2,
                      width: 235,
                      child: Image.asset(
                        AssetPaths.loginCharacter,
                        fit: BoxFit.contain,
                      ),
                    ),

                    // 2. CLOUD LEFT
                    Positioned(
                      left: -43,
                      top: 152,
                      width: 250,
                      height: 250,
                      child: Opacity(
                        opacity: 0.53,
                        child: Image.asset(
                          AssetPaths.loginCloud1,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),

                    // 3. CLOUD CENTER
                    Positioned(
                      left: 101,
                      top: 142,
                      width: 250,
                      height: 250,
                      child: Opacity(
                        opacity: 0.53,
                        child: Image.asset(
                          AssetPaths.loginCloud2,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),

                    // 4. CLOUD RIGHT
                    Positioned(
                      left: 283,
                      top: 180,
                      width: 175,
                      height: 175,
                      child: Opacity(
                        opacity: 0.43,
                        child: Transform.rotate(
                          angle: 3.14159,
                          child: Image.asset(
                            AssetPaths.loginCloud3,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Spacer ini membagi jarak dinamis antara awan dan teks
            const Spacer(flex: 2),

            // ================= BAGIAN TEKS DAN TOMBOL =================
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // TEKS JUDUL
                  const Text(
                    'Masuk untuk Fokusin',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: _dark,
                    ),
                  ),

                  const SizedBox(height: 28),

                  // TOMBOL GOOGLE
                  Container(
                    height: 58,
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(36),
                      border: Border.all(
                        color: const Color(0xFF8FD0FF),
                        width: 2,
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
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                AssetPaths.iconGoogle,
                                width: 24,
                              ),
                              const SizedBox(width: 14),
                              const Text(
                                'Lanjutkan dengan Google',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 36),

                  // LINK DAFTAR
                  Center(
                    child: RichText(
                      text: const TextSpan(
                        text: 'Belum punya akun? ',
                        style: TextStyle(
                          color: _dark,
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                        children: [
                          TextSpan(
                            text: 'Daftar',
                            style: TextStyle(
                              color: _blue,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(
                    height: 60,
                  ), // Margin bawah agar tidak mentok batas layar
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            // ================= KOTAK ILUSTRASI (KARAKTER + AWAN) =================
            SizedBox(
              width: double.infinity,
              child: FittedBox(
                fit: BoxFit.fitWidth,
                alignment: Alignment.topCenter,
                child: SizedBox(
                  width: 393,
                  height: 380,
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      // 1. KARAKTER UTAMA
                      Positioned(
                        top: 0,
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
            ),

            const SizedBox(height: 20),

            // ================= BAGIAN TEKS DAN TOMBOL =================
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // TEKS JUDUL (Menggunakan Poppins)
                  Text(
                    'Masuk untuk Fokusin',
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: _dark,
                    ),
                    textAlign: TextAlign.left,
                  ),

                  const SizedBox(height: 24),

                  // TOMBOL GOOGLE (Desain dipertahankan, teks diubah ke Poppins)
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
                              Text(
                                'Lanjutkan dengan Google',
                                style: GoogleFonts.poppins(
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

                  // LINK DAFTAR (Menggunakan Poppins)
                  Center(
                    child: RichText(
                      text: TextSpan(
                        text: 'Belum punya akun? ',
                        style: GoogleFonts.poppins(
                          color: _dark,
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                        children: [
                          TextSpan(
                            text: 'Daftar',
                            style: GoogleFonts.poppins(
                              color: _blue,
                              fontWeight: FontWeight.w700,
                            ),
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

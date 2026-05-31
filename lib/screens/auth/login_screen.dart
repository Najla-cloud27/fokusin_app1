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
        child: Stack(
          children: [
            // ================= CLOUDS =================
            Positioned(
              top: 240,
              left: 0,
              right: 0,

              child: Image.asset(AssetPaths.loginCloud1, fit: BoxFit.contain),
            ),

            // ================= CONTENT =================
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  const SizedBox(height: 42),

                  // ================= CHARACTER =================
                  Center(
                    child: Image.asset(AssetPaths.loginCharacter, width: 235),
                  ),

                  const Spacer(),

                  // ================= TITLE =================
                  const Text(
                    'Masuk untuk Fokusin',

                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: _dark,
                    ),
                  ),

                  const SizedBox(height: 28),

                  // ================= GOOGLE BUTTON =================
                  Container(
                    height: 58,

                    decoration: BoxDecoration(
                      color: _blue,

                      borderRadius: BorderRadius.circular(30),

                      border: Border.all(color: Colors.white, width: 2),
                    ),

                    child: Material(
                      color: Colors.transparent,

                      child: InkWell(
                        borderRadius: BorderRadius.circular(30),

                        onTap: () {},

                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,

                          children: [
                            SvgPicture.asset(AssetPaths.iconGoogle, width: 24),

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

                  const SizedBox(height: 36),

                  // ================= REGISTER =================
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

                  const SizedBox(height: 110),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

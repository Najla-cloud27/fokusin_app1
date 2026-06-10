import 'dart:math' as math;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

// Import Screen & Constants bawaan kamu
import 'package:fokusin_app1/screens/auth/register_screen.dart';
import 'package:fokusin_app1/screens/auth/google_auth_popup.dart';
import 'package:fokusin_app1/core/constants/asset_paths.dart';

// Import Widget Custom yang baru kita buat di folder widgets/auth/
import 'package:fokusin_app1/widgets/auth/auth_textfield.dart';
import 'package:fokusin_app1/widgets/auth/auth_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // Controller untuk menangkap input teks user
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  static const Color _bgColor = Color(0xFFFFF8E4);
  static const Color _blue = Color(0xFF2F9BF4);
  static const Color _dark = Color(0xFF1A1A2E);

  @override
  void dispose() {
    // Membersihkan controller saat screen ditutup agar tidak memakan memori
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _bgColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // 1. COMPONENT ILUSTRASI (Bawaan kode kamu yang super rapi)
            const _AuthIllustrationHeader(),

            const SizedBox(height: 20),

            // 2. BAGIAN FORM & BUTTON
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
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

                  // 👇 INPUT EMAIL (Menggunakan Custom Widget) 👇
                  AuthTextField(
                    controller: _emailController,
                    hintText: 'Masukkan Email',
                    prefixIcon: Icons.email_outlined,
                    keyboardType: TextInputType.emailAddress,
                  ),

                  const SizedBox(height: 16),

                  // 👇 INPUT PASSWORD (Menggunakan Custom Widget) 👇
                  AuthTextField(
                    controller: _passwordController,
                    hintText: 'Masukkan Kata Sandi',
                    prefixIcon: Icons.lock_outline,
                    obscureText: true,
                  ),

                  const SizedBox(height: 8),

                  // 👇 LINK LUPA KATA SANDI 👇
                  Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      onTap: () {
                        // Nanti diarahkan ke ForgotPasswordScreen
                      },
                      child: Text(
                        'Lupa Kata Sandi?',
                        style: GoogleFonts.poppins(
                          color: _blue,
                          fontWeight: FontWeight.w600,
                          fontSize: 13,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 24),

                  // 👇 TOMBOL MASUK (Sudah disesuaikan dengan desain Daftar) 👇
                  // 👇 TOMBOL MASUK (Sudah pakai border light blue persis seperti Daftar) 👇
                  Container(
                    height: 58,
                    padding: const EdgeInsets.all(
                      4,
                    ), // Jarak antara border luar dan tombol dalam
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(36),
                      border: Border.all(
                        color: const Color(
                          0xFF8FD0FF,
                        ), // Warna border biru muda (light)
                        width: 4, // Ketebalan border disamakan
                      ),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        color: _blue, // Warna tombol biru utama
                        borderRadius: BorderRadius.circular(32),
                      ),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(32),
                          onTap: () {
                            // print untuk testing input di debug console
                            print('Email: ${_emailController.text}');
                            print('Password: ${_passwordController.text}');
                          },
                          child: Center(
                            child: Text(
                              'Masuk',
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

                  const SizedBox(height: 24),

                  // 👇 GARIS PEMISAH "Atau" 👇
                  Row(
                    children: [
                      Expanded(
                        child: Divider(
                          color: Colors.grey.shade300,
                          thickness: 1,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                          'Atau',
                          style: GoogleFonts.poppins(
                            color: Colors.grey.shade500,
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          color: Colors.grey.shade300,
                          thickness: 1,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 24),

                  // 👇 TOMBOL GOOGLE (Bawaan kode kamu) 👇
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
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return const Dialog(
                                  backgroundColor: Colors.transparent,
                                  surfaceTintColor: Colors.transparent,
                                  child: GoogleAuthPopup(),
                                );
                              },
                            );
                          },
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

                  const SizedBox(height: 32),

                  // 👇 LINK PINDAH KE REGISTER (Bawaan kode kamu) 👇
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
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const RegisterScreen(),
                                  ),
                                );
                              },
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ================= WIDGET ILUSTRASI HEADER (100% Asli buatan kamu) =================
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

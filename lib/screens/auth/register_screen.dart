import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fokusin_app1/core/constants/asset_paths.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  static const Color _bgColor = Color(0xFFFFF8E4);
  static const Color _blue = Color(0xFF2F9BF4);
  static const Color _dark = Color(0xFF1A1A2E);
  static const Color _lightBlueFill = Color(0xFFEAF4FC);
  static const Color _borderColor = Color(0xFF8FD0FF);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _bgColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // ================= KOTAK ILUSTRASI =================
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
                      Positioned(
                        top: 0,
                        left: (393 - 235) / 2,
                        width: 235,
                        child: Image.asset(
                          AssetPaths.loginCharacter,
                          fit: BoxFit.contain,
                        ),
                      ),
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

            // ================= AREA FORM DAFTAR =================
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Judul Poppins
                  Text(
                    'Daftar untuk Fokusin',
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: _dark,
                    ),
                    textAlign: TextAlign.left,
                  ),

                  const SizedBox(height: 20),

                  // TEXTFIELD: Email (Input & Hint Poppins)
                  TextField(
                    style: GoogleFonts.poppins(color: _dark),
                    decoration: InputDecoration(
                      hintText: 'Email Anda',
                      hintStyle: GoogleFonts.poppins(color: Colors.black38),
                      filled: true,
                      fillColor: _lightBlueFill,
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 18,
                        horizontal: 24,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(36),
                        borderSide: const BorderSide(
                          color: _borderColor,
                          width: 2,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(36),
                        borderSide: const BorderSide(color: _blue, width: 2),
                      ),
                    ),
                  ),

                  const SizedBox(height: 16),

                  // TEXTFIELD: Password (Input & Hint Poppins)
                  TextField(
                    obscureText: true,
                    style: GoogleFonts.poppins(color: _dark),
                    decoration: InputDecoration(
                      hintText: 'Masukkan Password Anda',
                      hintStyle: GoogleFonts.poppins(color: Colors.black38),
                      filled: true,
                      fillColor: _lightBlueFill,
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 18,
                        horizontal: 24,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(36),
                        borderSide: const BorderSide(
                          color: _borderColor,
                          width: 2,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(36),
                        borderSide: const BorderSide(color: _blue, width: 2),
                      ),
                    ),
                  ),

                  const SizedBox(height: 12),

                  // FORGOT PASSWORD Poppins
                  Text(
                    'Forgot Password',
                    textAlign: TextAlign.right,
                    style: GoogleFonts.poppins(
                      color: _dark,
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                  ),

                  const SizedBox(height: 24),

                  // TOMBOL LOGIN Poppins
                  SizedBox(
                    height: 58,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: _blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(36),
                        ),
                        elevation: 0,
                      ),
                      child: Text(
                        'Login',
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
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

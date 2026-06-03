import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fokusin_app1/core/constants/asset_paths.dart';

class GoogleAuthPopup extends StatelessWidget {
  const GoogleAuthPopup({super.key});

  static const Color _bgColor = Color(0xFFFFF8E4);
  static const Color _blue = Color(0xFF2F9BF4);
  static const Color _dark = Color(0xFF1A1A2E);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: _bgColor,
        borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
      child: Column(
        mainAxisSize: MainAxisSize.min, // Agar popup tingginya menyesuaikan isi
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // ================= ILUSTRASI =================
          Center(
            child: Image.asset(
              'assets/images/ilustrasi_amankan_akun.png', // Pastikan nama gambar sesuai di foldermu
              height: 200,
              fit: BoxFit.contain,
            ),
          ),

          const SizedBox(height: 32),

          // ================= TEKS JUDUL =================
          Text(
            'Amankan Akunmu\ndengan verifikasi\nmudah',
            style: GoogleFonts.poppins(
              fontSize: 22,
              fontWeight: FontWeight.w700,
              color: _dark,
              height: 1.3,
            ),
            textAlign: TextAlign.left,
          ),

          const SizedBox(height: 32),

          // ================= TOMBOL GOOGLE (DUMMY) =================
          Container(
            height: 58,
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(36),
              border: Border.all(color: const Color(0xFF8FD0FF), width: 4),
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
                    // Menutup popup saat tombol diklik (karena masih dummy)
                    Navigator.pop(context);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        AssetPaths.iconGoogle, // Ikon Google SVG
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

          const SizedBox(height: 24),
        ],
      ),
    );
  }
}

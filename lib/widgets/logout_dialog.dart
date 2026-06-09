import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:go_router/go_router.dart';

class LogoutDialog extends StatelessWidget {
  const LogoutDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      child: Container(
        // Mengunci lebar maksimal dialog agar proporsinya tidak melar ke samping
        constraints: const BoxConstraints(maxWidth: 340),
        decoration: BoxDecoration(
          color: const Color(0xFFFFF8E4), // Background krem hangat sesuai Figma
          borderRadius: BorderRadius.circular(24.0),
          boxShadow: [
            BoxShadow(
              color: const Color(
                0xFF2574B2,
              ).withOpacity(0.12), // Shadow biru lembut luar
              blurRadius: 25,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 28.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // 1. HEADER: ICON PERINGATAN MERAH TEBAL & JUDUL
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons
                        .warning_amber_rounded, // Icon segitiga merah tebal figma
                    color: Color(0xFFE32525),
                    size: 30,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'Keluar dari fokusin',
                    style: GoogleFonts.poppins(
                      fontSize: 19,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xFFE32525),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // DIVIDER TEBAL SESUAI FIGMA
              const Divider(color: Colors.black26, height: 1, thickness: 1.2),
              const SizedBox(height: 24),

              // 2. TEKS DESKRIPSI TENGAH
              Text(
                'Apakah Kamu yakin ingin keluar\ndari Fokusin?',
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF2D2D2D),
                  height: 1.4,
                ),
              ),
              const SizedBox(height: 28),

              // 3. ROW TOMBOL DENGAN EFEK CONCENTRIC OUTER BORDER
              Row(
                children: [
                  // --- TOMBOL BATALKAN ---
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(
                        2.5,
                      ), // 🔥 KUNCI GAP KREM ANTARA BUTTON & BORDER
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        border: Border.all(
                          color: const Color(
                            0xFFA7D8FF,
                          ), // Border luar biru muda
                          width: 2.0,
                        ),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color(
                            0xFF6B6C6F,
                          ), // Isi tombol utama abu-abu
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            borderRadius: BorderRadius.circular(30),
                            onTap: () => Navigator.of(context).pop(),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 11),
                              child: Center(
                                child: Text(
                                  'Batalkan',
                                  style: GoogleFonts.poppins(
                                    fontSize: 13.5,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12), // Jarak antar tombol sesuai Figma
                  // --- TOMBOL KELUAR ---
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(
                        2.5,
                      ), // 🔥 KUNCI GAP KREM ANTARA BUTTON & BORDER
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        border: Border.all(
                          color: const Color(
                            0xFFFFCB33,
                          ), // Border luar kuning emas
                          width: 2.0,
                        ),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color(
                            0xFFE32525,
                          ), // Isi tombol utama merah
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            borderRadius: BorderRadius.circular(30),
                            onTap: () {
                              Navigator.of(context).pop();
                              context.go(
                                '/login',
                              ); // Tetap menjalankan fungsi redirect logout aslimu
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 11),
                              child: Center(
                                child: Text(
                                  'Keluar',
                                  style: GoogleFonts.poppins(
                                    fontSize: 13.5,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class TugasItem extends StatelessWidget {
  final String namaTugas;
  final String infoWaktu;
  final bool apakahTerpilih;
  final bool isRepeat;
  final bool isSelesai; // <--- Parameter untuk warna biru
  final bool isTerlewat; // <--- Parameter untuk warna abu-abu
  final VoidCallback onTap;
  final VoidCallback onHapus;

  const TugasItem({
    Key? key,
    required this.namaTugas,
    required this.infoWaktu,
    required this.apakahTerpilih,
    this.isRepeat = false,
    this.isSelesai = false,
    this.isTerlewat = false,
    required this.onTap,
    required this.onHapus,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 🎨 1. LOGIKA WARNA DI SINI
    Color backgroundColor;
    Color borderColor;

    if (isTerlewat) {
      backgroundColor = const Color(0xFFC3C3C3); // Abu-abu jika terlewat
      borderColor = const Color(0xFF9E9E9E);
    } else if (isSelesai) {
      backgroundColor = const Color(0xFF90CAFF); // Biru jika selesai
      borderColor = const Color(0xFF229EFF);
    } else {
      // Warna default (krem jika tidak terpilih, biru muda jika terpilih)
      backgroundColor = apakahTerpilih
          ? const Color(0xFFA7D8FF)
          : const Color(0xFFFFFDF5);
      borderColor = const Color(0xFFBEE3F8);
    }

    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Kapsul Pengulangan Setiap Hari
            if (isRepeat)
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                decoration: const BoxDecoration(
                  color: Color(0xFF229EFF), // Warna biru kapsul
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Text(
                  'Pengulangan setiap hari',
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),

            // Kotak Utama Tugas
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              decoration: BoxDecoration(
                color:
                    backgroundColor, // 👈 KUNCI 1: Harus pakai variabel warna di atas
                borderRadius: isRepeat
                    ? const BorderRadius.only(
                        bottomLeft: Radius.circular(24),
                        bottomRight: Radius.circular(24),
                      )
                    : BorderRadius.circular(24),
                border: Border.all(
                  color:
                      borderColor, // 👈 KUNCI 2: Harus pakai variabel border di atas
                  width: 1.5,
                ),
              ),
              child: Row(
                children: [
                  // Ikon Lingkaran / Ceklis
                  isSelesai
                      ? const Icon(
                          Icons
                              .check_circle, // Sementara pakai Icon bawaan dulu untuk tes warna biru
                          color: Colors.white,
                          size: 26,
                        )
                      : Container(
                          width: 26,
                          height: 26,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: isTerlewat
                                  ? const Color(0xFF757575)
                                  : const Color(0xFF141414),
                              width: 2,
                            ),
                          ),
                        ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          namaTugas,
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: isTerlewat
                                ? const Color(0xFF757575)
                                : const Color(0xFF141414),
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          infoWaktu,
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            color: const Color(0xFF757575),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: onHapus,
                    child: SvgPicture.asset(
                      'assets/icons/cuida_trash-outline.svg',
                      width: 24,
                      height: 24,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart'; // 1. Tambahkan import GoRouter di sini
import 'package:fokusin_app1/core/constants/asset_paths.dart';

class GoogleAuthPopup extends StatelessWidget {
  const GoogleAuthPopup({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 330,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 36),
        decoration: BoxDecoration(
          color: const Color(0xFFFFFDF4),
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.15),
              blurRadius: 25,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Ikon Google
            SvgPicture.asset(
              'assets/icons/icon_google.svg',
              width: 32,
              height: 32,
            ),
            const SizedBox(height: 18),

            // Judul Dialog
            const Text(
              'Pilih akun Google',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1A1A2E),
              ),
            ),
            const SizedBox(height: 6),

            // Subtitle Dialog
            const Text(
              'Untuk melanjutkan ke fokusin',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 12, color: Colors.black54),
            ),

            const SizedBox(height: 36),

            // 2. Bungkus Baris Informasi Profil Akun dengan InkWell agar bisa diklik
            InkWell(
              onTap: () {
                Navigator.pop(context); // Tutup dialog popup terlebih dahulu
                context.go(
                  '/home',
                ); // Pindah ke halaman HomeScreen menggunakan GoRouter
              },
              borderRadius: BorderRadius.circular(
                12,
              ), // Efek ripple melengkung rapi
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 8.0,
                  horizontal: 4.0,
                ), // Memperluas area klik
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.black12, width: 0.5),
                      ),
                      child: const CircleAvatar(
                        radius: 22,
                        backgroundColor: Colors.transparent,
                        backgroundImage: AssetImage('assets/images/profil.png'),
                      ),
                    ),
                    const SizedBox(width: 14),
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Anna syla',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF1A1A2E),
                            ),
                          ),
                          SizedBox(height: 2),
                          Text(
                            'annasyla@gmail.com',
                            style: TextStyle(
                              fontSize: 11,
                              color: Colors.black45,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 18),

            // Garis Pembatas Tipis
            const Divider(color: Colors.black12, thickness: 0.8),
            const SizedBox(height: 18),

            // Tombol Tambahkan Akun Lain
            InkWell(
              onTap: () {
                // Tambahkan aksi jika ingin menambah akun lain
              },
              borderRadius: BorderRadius.circular(8),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      'assets/icons/Vector_contact.svg',
                      width: 22,
                      height: 22,
                    ),
                    const SizedBox(width: 14),
                    const Text(
                      'Tambahkan akun lain',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF1976D2),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

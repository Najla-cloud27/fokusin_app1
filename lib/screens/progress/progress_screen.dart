import 'package:flutter/material.dart';
import 'package:fokusin_app1/drawer/custom_sidebar_kategori.dart';
import 'package:fokusin_app1/screens/home/home_screen.dart';
import 'package:fokusin_app1/screens/kategori/kelola_kategori_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProgressScreen extends StatelessWidget {
  const ProgressScreen({super.key});

  static const Color _bgColor = Color(0xFFFFF8E4);

  final List<Map<String, dynamic>> progressData = const [
    {
      "title": "Kemajuan Hari Ini",
      "date": "15 mei 2026",
      "current": 3,
      "total": 5,
    },
    {
      "title": "Progress Harian",
      "date": "14 mei 2026",
      "current": 4,
      "total": 5,
    },
    {
      "title": "Progress Harian",
      "date": "13 mei 2026",
      "current": 5,
      "total": 5,
    },
    {
      "title": "Progress Harian",
      "date": "12 mei 2026",
      "current": 2,
      "total": 6,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _bgColor,

      // 🛠️ 1. INTEGRASI SIDEBAR DRAWER KAMU DI SINI
      drawer: CustomSidebarKategori(
        selectedIndex:
            2, // Pastikan ini 2, karena sedang aktif di menu Progres Ku
        onItemSelected: (index) {
          if (index == 0) {
            // Kembali ke halaman Pomodoro
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const HomeScreen(),
              ), // Sesuaikan dengan nama class Pomodoro-mu
            );
          } else if (index == 1) {
            // Pergi ke halaman List Kategori
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const KelolaKategoriPage(),
              ), // Sesuaikan dengan nama class List Kategori-mu
            );
          } else if (index == 2) {
            // Sedang di Progres Ku, jadi tidak perlu melakukan apa-apa
            print("Sudah di halaman Progres Ku");
          } else if (index == 3) {
            // Logika untuk Keluar/Logout
          }
        },
      ),

      body: SafeArea(
        child: Stack(
          children: [
            // ================= LOGO MASKOT BACKGROUND =================
            Positioned(
              top: 300,
              left: 0,
              right: 0,
              child: Align(
                alignment: Alignment.center,
                child: Opacity(
                  opacity: 0.6,
                  child: Image.asset(
                    'assets/images/gambar7.png',
                    width: 320,
                    height: 352,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),

            // ================= KONTEN UTAMA =================
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // HEADER "Progres Ku"
                Padding(
                  padding: const EdgeInsets.only(left: 24, top: 40),
                  child: Row(
                    children: [
                      // 🛠️ 2. BUNGKUS LOGO DENGAN BUILDER & GESTURE DETECTOR BIAR BISA DIKLIK
                      Builder(
                        builder: (context) {
                          return GestureDetector(
                            onTap: () {
                              Scaffold.of(
                                context,
                              ).openDrawer(); // Membuka drawer sidebar
                            },
                            child: SvgPicture.asset(
                              'assets/icons/logo_blue.svg',
                              width: 24,
                              height: 24,
                            ),
                          );
                        },
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'Progres Ku',
                        style: GoogleFonts.poppins(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: const Color(0xFF1A1A2E),
                        ),
                      ),
                    ],
                  ),
                ),

                // 🛠️ Jarak diturunkan dari 36 ke 60 agar card tidak terlalu ke atas
                const SizedBox(height: 60),

                // LIST CARD PROGRESS
                Expanded(
                  child: ListView.separated(
                    // 🛠️ Ditambahkan bottom padding 40 biar scroll mentok bawah terlihat rapi
                    padding: const EdgeInsets.only(
                      left: 24,
                      right: 24,
                      bottom: 40,
                    ),
                    itemCount: progressData.length,
                    separatorBuilder: (context, index) => const SizedBox(
                      height: 20,
                    ), // 🛠️ Jarak antar card diperlebar biar ruang bawah terisi padat
                    itemBuilder: (context, index) {
                      final item = progressData[index];
                      return Center(
                        child: _ProgressCard(
                          title: item["title"],
                          date: item["date"],
                          current: item["current"],
                          total: item["total"],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// ============================================================================
// WIDGET CUSTOM CARD PROGRESS
// ============================================================================
class _ProgressCard extends StatelessWidget {
  final String title;
  final String date;
  final int current;
  final int total;

  const _ProgressCard({
    required this.title,
    required this.date,
    required this.current,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 330,
      height: 146,
      padding: const EdgeInsets.only(top: 16, right: 18, bottom: 16, left: 18),
      decoration: BoxDecoration(
        color: const Color(0xFF229EFF),
        borderRadius: BorderRadius.circular(26),
        border: Border.all(color: const Color(0xFFFFCB33), width: 2.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // 1. BARIS ATAS: JUDUL & TARGET ICON LOGO
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text.rich(
                TextSpan(
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                  children: [
                    TextSpan(text: title),
                    TextSpan(
                      text: ' ($date)',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w400,
                        fontSize: 10,
                        color: Colors.white.withOpacity(0.8),
                      ),
                    ),
                  ],
                ),
              ),
              SvgPicture.asset(
                'assets/icons/logo_white.svg',
                width: 32,
                height: 32,
              ),
            ],
          ),

          // 2. BARIS TENGAH: ANGKA PROGRES & SUBTEXT
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '$current',
                style: GoogleFonts.poppins(
                  fontSize: 32,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFFFFCB33),
                  height: 1.0,
                ),
              ),
              const SizedBox(width: 6),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Dari $total',
                    style: GoogleFonts.poppins(
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                      height: 1.1,
                    ),
                  ),
                  Text(
                    'selesai',
                    style: GoogleFonts.poppins(
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                      height: 1.1,
                    ),
                  ),
                ],
              ),
            ],
          ),

          // 3. BARIS BAWAH: CUSTOM PROGRESS BAR DENGAN MASKOT
          LayoutBuilder(
            builder: (context, constraints) {
              final double availableWidth = constraints.maxWidth;
              final double percentage = (current / total).clamp(0.0, 1.0);

              const double mascotSize = 40.0;

              return Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.centerLeft,
                children: [
                  // Track Background Bar
                  Container(
                    height: 8,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),

                  // Progress Terisi
                  Container(
                    width: availableWidth * percentage,
                    height: 8,
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFCB33),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),

                  // Maskot Kecil Bergeser Otomatis
                  Positioned(
                    left: (availableWidth * percentage) - (mascotSize / 2),
                    top: -16,
                    child: Image.asset(
                      'assets/images/gambar7.png',
                      width: mascotSize,
                      height: mascotSize,
                      fit: BoxFit.contain,
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}

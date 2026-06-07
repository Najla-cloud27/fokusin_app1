import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fokusin_app1/drawer/custom_sidebar_kategori.dart';
import 'package:fokusin_app1/screens/kategori/edit_kategori.dart';
import 'package:fokusin_app1/screens/kategori/tambah_kategori_tugas.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:fokusin_app1/screens/home/home_screen.dart';

class KelolaKategoriPage extends StatefulWidget {
  const KelolaKategoriPage({Key? key}) : super(key: key);

  @override
  State<KelolaKategoriPage> createState() => _KelolaKategoriPageState();
}

class _KelolaKategoriPageState extends State<KelolaKategoriPage> {
  int _selectedIndex = 1;

  // Variabel state untuk mengontrol mode edit
  bool _isEditing = false;

  // DATA DUMMY KATEGORI DENGAN WARNA DASAR MASING-MASING
  final List<Map<String, dynamic>> dummyKategori = [
    {
      'nama': 'Tugas Sekolah',
      'warna': const Color(0xFFDB3E8D),
      'icon': 'assets/images/gambar6.png',
    },
    {
      'nama': 'Kerjaan rumah',
      'warna': const Color(0xFF1B867F),
      'icon': 'assets/images/gambar6.png',
    },
    {
      'nama': 'Tugas malam',
      'warna': const Color(0xFFA7FE3D),
      'icon': 'assets/images/gambar6.png',
    },
    {
      'nama': 'Spiritual',
      'warna': const Color(0xFFFE8616),
      'icon': 'assets/images/gambar6.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF8E4),
      drawer: CustomSidebarKategori(
        selectedIndex: _selectedIndex,
        onItemSelected: (index) {
          setState(() {
            _selectedIndex = index;
          });

          // Navigasi ke halaman utama (Pomodoro) jika menu Pomodoro (index 0) diklik
          if (index == 0) {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const HomeScreen()),
              (route) => false, // Membersihkan stack halaman terdahulu
            );
          }
        },
      ),
      // TOMBOL EDIT DI POJOK KANAN BAWAH
      floatingActionButton: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.15),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: FloatingActionButton.extended(
          onPressed: () {
            // Ubah status _isEditing saat tombol ditekan
            setState(() {
              _isEditing = !_isEditing;
            });
          },
          backgroundColor: const Color(0xFFFFF8E4),
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          icon: SvgPicture.asset(
            'assets/icons/mingcute_pencil.svg',
            width: 20,
            height: 20,
            colorFilter: const ColorFilter.mode(
              Color(0xFF229EFF),
              BlendMode.srcIn,
            ),
          ),
          // Teks tombol berubah dinamis sesuai mode aktif
          label: Text(
            _isEditing ? 'Selesai' : 'Edit',
            style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF229EFF),
            ),
          ),
        ),
      ),
      body: Builder(
        builder: (context) {
          return SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 25, left: 16, right: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Judul: Kelola Kategori
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Scaffold.of(context).openDrawer();
                            },
                            child: SizedBox(
                              width: 44,
                              child: Center(
                                child: SvgPicture.asset(
                                  'assets/icons/logo_panah.svg',
                                  width: 28,
                                  height: 28,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Text(
                            'Kelola Kategori',
                            style: GoogleFonts.poppins(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: const Color(0xFF141414),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),

                      // Tombol Tambahkan Kategori
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const TambahKategoriTugas(),
                            ),
                          );
                        },
                        child: SizedBox(
                          width: double.infinity,
                          height: 85,
                          child: Stack(
                            clipBehavior: Clip.none,
                            children: [
                              Positioned(
                                bottom: 0,
                                left: 0,
                                right: 0,
                                child: Container(
                                  height: 58,
                                  padding: const EdgeInsets.all(2),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(36),
                                    border: Border.all(
                                      color: const Color(0xFFFFCB33),
                                      width: 2,
                                    ),
                                  ),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: const Color(0xFF229EFF),
                                      borderRadius: BorderRadius.circular(34),
                                    ),
                                    padding: const EdgeInsets.only(right: 16),
                                    child: Row(
                                      children: [
                                        SizedBox(
                                          width: 40,
                                          child: Center(
                                            child: SvgPicture.asset(
                                              'assets/icons/Vector 1.svg',
                                              width: 20,
                                              height: 20,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(width: 14),
                                        Text(
                                          'Tambahkan Kategori',
                                          style: GoogleFonts.poppins(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                right: 12,
                                bottom: 0,
                                child: Image.asset(
                                  'assets/images/logo_kelola.png',
                                  height: 80,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 24),
                const Divider(
                  color: Color(0xFF929292),
                  thickness: 1,
                  height: 1,
                ),

                // KONTEN TENGAH / LIST KATEGORI DUMMY
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: GridView.builder(
                      itemCount: dummyKategori.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: 14,
                            mainAxisSpacing: 16,
                            childAspectRatio: 0.88,
                          ),
                      itemBuilder: (context, index) {
                        final item = dummyKategori[index];

                        return GestureDetector(
                          onTap: () {
                            // Membuka EditKategori sebagai pop-up overlay transparan
                            if (_isEditing) {
                              Navigator.push(
                                context,
                                PageRouteBuilder(
                                  opaque:
                                      false, // Latar belakang utama tetap terlihat transparan
                                  transitionDuration: const Duration(
                                    milliseconds: 250,
                                  ),
                                  pageBuilder: (context, _, __) =>
                                      const EditKategori(),
                                ),
                              );
                            }
                          },
                          child: Stack(
                            children: [
                              // Kotak Utama Kategori
                              Positioned.fill(
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFFFF8E4),
                                    borderRadius: BorderRadius.circular(16),
                                    border: Border.all(
                                      color: item['warna'],
                                      width: 2,
                                    ),
                                    // PERBAIKAN: Sekarang boxShadow sudah masuk ke dalam BoxDecoration dengan benar
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.05),
                                        blurRadius: 6,
                                        offset: const Offset(0, 4),
                                      ),
                                    ],
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        item['icon'],
                                        height: 48,
                                        fit: BoxFit.contain,
                                      ),
                                      const SizedBox(height: 8),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 4.0,
                                        ),
                                        child: Text(
                                          item['nama'],
                                          textAlign: TextAlign.center,
                                          style: GoogleFonts.poppins(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600,
                                            color: const Color(0xFF141414),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),

                              // Tampilkan Lingkaran Outline #141414 di pojok kiri atas saat _isEditing bernilai true
                              if (_isEditing)
                                Positioned(
                                  top: 10,
                                  left: 10,
                                  child: Container(
                                    width: 18,
                                    height: 18,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.white,
                                      border: Border.all(
                                        color: const Color(0xFF141414),
                                        width: 1.5,
                                      ),
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

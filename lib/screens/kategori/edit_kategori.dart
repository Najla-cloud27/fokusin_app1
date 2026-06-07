import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class EditKategori extends StatefulWidget {
  const EditKategori({Key? key}) : super(key: key);

  @override
  State<EditKategori> createState() => _EditKategoriState();
}

class _EditKategoriState extends State<EditKategori> {
  // Daftar 24 Warna sesuai spesifikasi Figma
  final List<Color> categoryColors = [
    const Color(0xFFF16E96),
    const Color(0xFFFC9390),
    const Color(0xFFAB82A4),
    const Color(0xFF7759A3),
    const Color(0xFF76BBC0),
    const Color(0xFF899064),
    const Color(0xFFDB3E8D),
    const Color(0xFFFFAFEC),
    const Color(0xFFF5C45D),
    const Color(0xFF66A4ED),
    const Color(0xFFA609F0),
    const Color(0xFF000180),
    const Color(0xFF006EE9),
    const Color(0xFF83E7FF),
    const Color(0xFFD1FFA4),
    const Color(0xFFB1C228),
    const Color(0xFF535C1D),
    const Color(0xFFFA6B41),
    const Color(0xFFFC3C31),
    const Color(0xFFFE8616),
    const Color(0xFFA7FE3D),
    const Color(0xFF00B6FF),
    const Color(0xFF2B6B6D),
    const Color(0xFF7B46F8),
  ];

  int? selectedColorIndex; // Untuk menyimpan status warna mana yang diklik

  @override
  Widget build(BuildContext context) {
    // Scaffold dibuat transparan agar halaman belakangnya (Kelola Kategori) tetap terlihat
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(
        0.4,
      ), // Efek gelap di latar belakang
      body: Column(
        mainAxisAlignment:
            MainAxisAlignment.end, // Mendorong konten ke paling bawah
        children: [
          // Area kosong di atas untuk menutup form/keyboard jika di-tap
          Expanded(
            child: GestureDetector(
              onTap: () {
                FocusScope.of(context).unfocus();
                Navigator.pop(context); // Bisa ditutup jika klik area luar
              },
              child: Container(color: Colors.transparent),
            ),
          ),

          // --- KONTEN FORM (Ga Full Selayar) ---
          Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.topCenter,
            children: [
              // 1. KOTAK UTAMA (Warna Latar #FFF8E4)
              Container(
                margin: const EdgeInsets.only(
                  top: 30,
                ), // Ruang agar logo bisa menonjol di atas
                padding: const EdgeInsets.only(
                  top: 40, // Ruang kosong ekstra untuk logo
                  left: 24,
                  right: 24,
                  bottom: 24,
                ),
                decoration: const BoxDecoration(
                  color: Color(0xFFFFF8E4),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize
                      .min, // Tinggi menyesuaikan isi konten (bukan selayar)
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // --- AREA INPUT (Container Biru) ---
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: const Color(0xFF229EFF),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Nama kategori',
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          TextField(
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                            cursorColor: Colors.white,
                            decoration: InputDecoration(
                              hintText: 'Tugas Sekolah',
                              hintStyle: GoogleFonts.poppins(
                                color: Colors.white70,
                                fontSize: 16,
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                vertical: 8,
                              ),
                              enabledBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.white,
                                  width: 1,
                                ),
                              ),
                              focusedBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.white,
                                  width: 2,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 24),

                    // --- TOMBOL PILIH WARNA ---
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFF229EFF),
                        borderRadius: BorderRadius.circular(7),
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0xFFFFE085),
                            blurRadius: 4,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Text(
                        'Pilih Warna',
                        style: GoogleFonts.poppins(
                          color: const Color(0xFFFFF8E4),
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    const SizedBox(height: 16),

                    // --- GRID 24 WARNA ---
                    GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 6,
                            crossAxisSpacing: 14,
                            mainAxisSpacing: 14,
                            childAspectRatio: 1.0,
                          ),
                      itemCount: categoryColors.length,
                      itemBuilder: (context, index) {
                        final color = categoryColors[index];
                        final isSelected = selectedColorIndex == index;

                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedColorIndex = index;
                            });
                          },
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 200),
                            decoration: BoxDecoration(
                              color: color,
                              borderRadius: BorderRadius.circular(
                                isSelected ? 16 : 8,
                              ),
                              border: isSelected
                                  ? Border.all(color: Colors.black87, width: 3)
                                  : null,
                            ),
                          ),
                        );
                      },
                    ),

                    const SizedBox(height: 32),

                    // --- TOMBOL BATAL & SELESAI ---
                    Row(
                      children: [
                        // Tombol Batal
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context); // Fungsi Batal
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF626262),
                              padding: const EdgeInsets.symmetric(vertical: 14),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                                side: const BorderSide(
                                  color: Color(0xFF7AC5FF), // Border Light Blue
                                  width: 2,
                                ),
                              ),
                              elevation: 0,
                            ),
                            child: Text(
                              'Batal',
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        // Tombol Selesai
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context); // Fungsi Selesai
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF229EFF),
                              padding: const EdgeInsets.symmetric(vertical: 14),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                                side: const BorderSide(
                                  color: Color(
                                    0xFFFFCB33,
                                  ), // Border Light Yellow
                                  width: 2,
                                ),
                              ),
                              elevation: 0,
                            ),
                            child: Text(
                              'Selesai',
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10), // Jarak aman bawah
                  ],
                ),
              ),

              // 2. LOGO TENGAH ATAS (Menimpa garis batas container)
              Positioned(
                top: 0,
                child: Container(
                  width: 60,
                  height: 60,
                  padding: const EdgeInsets.all(4),
                  decoration: const BoxDecoration(
                    color: Color(0xFF229EFF),
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xFFFFE085),
                        blurRadius: 4,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Center(
                    child: SvgPicture.asset(
                      'assets/icons/logo_white.svg', // Pastikan assetnya ada
                      width: 32,
                      height: 38,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

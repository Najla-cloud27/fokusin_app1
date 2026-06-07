import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:go_router/go_router.dart';
import '../../drawer/custom_drawer.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool isNotifikasiOn = false;
  bool isTemaDark = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDF7E7), // Background cream
      drawer: const CustomDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF0C6BBE)),
          onPressed: () => context.pop(), // Kembali menggunakan GoRouter
        ),
        title: Text(
          'Profil',
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              // Bagian Foto Profil dengan Efek Blur Gelombang Biru
              Center(
                child: SizedBox(
                  height: 200,
                  width: double.infinity,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      // Efek Blur Gelombang Biru di belakang foto
                      Container(
                        width: 160,
                        height: 160,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xFF007BFF).withOpacity(0.4),
                              blurRadius: 80,
                              spreadRadius: 60,
                            ),
                          ],
                        ),
                      ),
                      // Foto Profil
                      const CircleAvatar(
                        radius: 70,
                        backgroundImage: NetworkImage(
                          'https://i.pravatar.cc/300?img=47',
                        ), // Gambar dummy
                      ),
                      // Icon Camera di Pojok Kanan Bawah
                      Positioned(
                        bottom: 25,
                        right: MediaQuery.of(context).size.width / 2 - 80,
                        child: Container(
                          padding: const EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: const Color(0xFF0C6BBE),
                              width: 1.5,
                            ),
                          ),
                          child: const Icon(
                            Icons.camera_alt_outlined,
                            color: Color(0xFF0C6BBE),
                            size: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 32),

              // Label Pengaturan
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: const BoxDecoration(shape: BoxShape.circle),
                    child: const Icon(
                      Icons.settings_suggest_outlined, // Mirip dengan Figma
                      color: Color(0xFF6C98B6),
                      size: 28,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'Pengaturan',
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Card Nama
              _buildProfileCard(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Anna syla',
                      style: GoogleFonts.poppins(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Colors.black87,
                      ),
                    ),
                    const Icon(Icons.edit_outlined, color: Color(0xFF0C6BBE)),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              // Card Email
              _buildProfileCard(
                child: Text(
                  'annasylaa@gmail.com',
                  style: GoogleFonts.poppins(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Colors.black54,
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Card Pengaturan (Notifikasi & Tema)
              _buildProfileCard(
                child: Column(
                  children: [
                    // Notifikasi
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Icon(
                              Icons.notifications_none,
                              color: Colors.black87,
                            ),
                            const SizedBox(width: 12),
                            Text(
                              'Notifikasi',
                              style: GoogleFonts.poppins(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Colors.black87,
                              ),
                            ),
                          ],
                        ),
                        Switch(
                          value: isNotifikasiOn,
                          onChanged: (val) {
                            setState(() {
                              isNotifikasiOn = val;
                            });
                          },
                          activeColor: const Color(0xFF0C6BBE),
                          inactiveThumbColor: Colors.white,
                          inactiveTrackColor: Colors.black26,
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    // Tema
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Icon(
                              Icons.toggle_off_outlined,
                              color: Colors.black87,
                            ), // Icon mirip toggle
                            const SizedBox(width: 12),
                            Text(
                              'Tema',
                              style: GoogleFonts.poppins(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Colors.black87,
                              ),
                            ),
                          ],
                        ),
                        Switch(
                          value: isTemaDark,
                          onChanged: (val) {
                            setState(() {
                              isTemaDark = val;
                            });
                          },
                          activeColor: Colors.white,
                          activeTrackColor: const Color(0xFF0C6BBE),
                          inactiveThumbColor: Colors.white,
                          inactiveTrackColor: Colors.black26,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }

  // Helper Widget untuk membangun Card sesuai style Figma
  Widget _buildProfileCard({required Widget child}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
      decoration: BoxDecoration(
        color: const Color(0xFFFDF7E7), // Warna sama dengan background
        borderRadius: BorderRadius.circular(30), // Radius besar
        border: Border.all(
          color: const Color(0xFFB1D4E5), // Border biru muda
          width: 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(
              0xFF007BFF,
            ).withOpacity(0.15), // Shadow blur biru
            blurRadius: 15,
            spreadRadius: 0,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: child,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:go_router/go_router.dart';

class CustomSidebarKategori extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemSelected;

  const CustomSidebarKategori({
    Key? key,
    required this.selectedIndex,
    required this.onItemSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // SizedBox width 198 sudah dihapus, langsung pakai Drawer agar mengikuti lebar dari HomeScreen
    return Drawer(
      backgroundColor: const Color(0xFFFFF8E4),
      elevation: 0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 63), // Top: 63px
          // Bungkus dengan Padding agar isi laci tidak menabrak pinggir layar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 1. KOTAK PROFIL
                // DIBUNGKUS GestureDetector agar area profil bisa diklik menuju '/profile'
                GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () {
                    Navigator.pop(context); // Tutup laci dulu
                    context.go('/profile'); // Pindah ke halaman profil
                  },
                  child: SizedBox(
                    height: 62,
                    child: Row(
                      children: [
                        // --- FOTO PROFIL ---
                        const CircleAvatar(
                          radius: 24,
                          backgroundColor: Colors.grey,
                          backgroundImage:
                              AssetImage('assets/images/profil.png'),
                        ),
                        const SizedBox(width: 12),

                        // Teks Nama & Profil
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Anna syla',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.poppins(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: const Color(0xFF1A1A1A),
                                ),
                              ),
                              const SizedBox(height: 2),
                              Text(
                                'Profil Ku',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.poppins(
                                  fontSize: 12,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 12),

                        // Ikon Pensil
                        SvgPicture.asset(
                          'assets/icons/mingcute_pencil.svg',
                          width: 28,
                          height: 28,
                          colorFilter: const ColorFilter.mode(
                            Color(0xFF1B7ECC),
                            BlendMode.srcIn,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // --- GARIS DI BAWAH PROFIL ---
                const SizedBox(height: 16),
                const Divider(
                  color: Color(0xFF141414),
                  thickness: 1,
                  height: 1,
                ),
                const SizedBox(height: 17),

                // 2. MENU ITEM
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildMenuItem(
                      context,
                      index: 0,
                      iconPath: 'assets/icons/Vector.svg',
                      title: 'Pomodoro',
                      route: '/home', // Ditambahkan Route
                    ),
                    const SizedBox(height: 10),
                    _buildMenuItem(
                      context,
                      index: 1,
                      iconPath: 'assets/icons/list_star.svg',
                      title: 'List Kategori',
                      route: '/kategori', // Ditambahkan Route
                    ),
                    const SizedBox(height: 10),
                    _buildMenuItem(
                      context,
                      index: 2,
                      iconPath: 'assets/icons/typcn_chart-line.svg',
                      title: 'Progres Ku',
                      route: '/progress', // Ditambahkan Route
                    ),
                    const SizedBox(height: 10),
                    _buildMenuItem(
                      context,
                      index: 3,
                      iconPath: 'assets/icons/tabler_logout-2.svg',
                      title: 'Keluar',
                      isLogout: true, // Memanggil popup logout
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Spacer mendorong footer "Tentang Kami" agar terus berada di bawah
          const Spacer(),

          // --- FOOTER TENTANG KAMI ---
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Divider(color: Color(0xFF626262), thickness: 1),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 24, bottom: 24, top: 16),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(6),
                  decoration: const BoxDecoration(shape: BoxShape.circle),
                  child: SvgPicture.asset(
                    'assets/icons/logo_panah.svg',
                    width: 20,
                    height: 20,
                  ),
                ),
                const SizedBox(width: 12),
                Text(
                  'Tentang kami',
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // --- FUNGSI BANTUAN MENU ITEM ---
  Widget _buildMenuItem(
    BuildContext context, {
    required int index,
    required String iconPath,
    required String title,
    String? route, // Parameter route ditambahkan
    bool isLogout = false,
  }) {
    final isActive = selectedIndex == index;
    Color itemColor =
        isLogout ? const Color(0xFFE53935) : const Color(0xFF424242);
    if (isActive) itemColor = Colors.white;

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        // 1. Tutup laci/drawer dulu
        Navigator.pop(context);

        if (isLogout) {
          // Jika tombol keluar, panggil pop up dari kode sebelumnya
          _showLogoutDialog(context);
        } else {
          // 2. Jika tombol menu biasa, ubah status index & pindah route
          Future.delayed(const Duration(milliseconds: 150), () {
            onItemSelected(index);
            if (route != null) {
              context.go(route); // Mengarahkan langsung ke page tujuan
            }
          });
        }
      },
      child: Container(
        width: double.infinity,
        height: 36,
        decoration: BoxDecoration(
          color: isActive ? const Color(0xFF1B7ECC) : Colors.transparent,
          borderRadius: BorderRadius.circular(18),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          children: [
            SvgPicture.asset(
              iconPath,
              width: 20,
              height: 20,
              colorFilter: ColorFilter.mode(itemColor, BlendMode.srcIn),
            ),
            const SizedBox(width: 12),
            Text(
              title,
              style: GoogleFonts.poppins(
                color: itemColor,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // --- POP UP NOTIFIKASI KELUAR (Sesuai kode sebelumnya) ---
  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext dialogContext) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          backgroundColor: const Color(0xFFFDF6E3),
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      'assets/icons/peringatan.svg',
                      width: 28,
                      height: 28,
                    ),
                    const SizedBox(width: 10),
                    const Text(
                      'Keluar dari fokusin',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFE53935), // Merah
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                const Divider(color: Colors.black26, thickness: 1),
                const SizedBox(height: 15),
                const Text(
                  'Apakah Kamu yakin ingin keluar\ndari Fokusin?',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 30),
                Row(
                  children: [
                    Expanded(
                      child: MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF6B6B6B),
                            foregroundColor: Colors.white,
                            elevation: 0,
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                          onPressed: () {
                            Navigator.pop(dialogContext);
                          },
                          child: const Text(
                            'Batalkan',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 15),
                    Expanded(
                      child: MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFE53935),
                            foregroundColor: Colors.white,
                            elevation: 0,
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                          onPressed: () {
                            Navigator.pop(dialogContext); // Tutup dialog
                            context.go('/login'); // Pindah ke halaman login
                          },
                          child: const Text(
                            'Keluar',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600,
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
        );
      },
    );
  }
}
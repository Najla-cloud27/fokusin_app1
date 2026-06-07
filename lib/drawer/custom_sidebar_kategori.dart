import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

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
                SizedBox(
                  height: 62,
                  child: Row(
                    children: [
                      // --- FOTO PROFIL ---
                      const CircleAvatar(
                        radius: 24,
                        backgroundColor: Colors.grey,
                        backgroundImage: AssetImage('assets/images/profil.png'),
                      ),
                      const SizedBox(width: 12),

                      // Teks Nama & Profil (Sekarang pakai Expanded tanpa batasan ruang!)
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

                // --- GARIS DI BAWAH PROFIL ---
                const SizedBox(height: 16),
                const Divider(
                  color: Color(0xFF141414),
                  thickness: 1,
                  height: 1,
                ),
                const SizedBox(height: 17),

                // 2. MENU ITEM (Sudah tidak ada batasan width 186)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildMenuItem(
                      context,
                      index: 0,
                      iconPath: 'assets/icons/Vector.svg',
                      title: 'Pomodoro',
                    ),
                    const SizedBox(height: 10),
                    _buildMenuItem(
                      context,
                      index: 1,
                      iconPath: 'assets/icons/list_star.svg',
                      title: 'List Kategori',
                    ),
                    const SizedBox(height: 10),
                    _buildMenuItem(
                      context,
                      index: 2,
                      iconPath: 'assets/icons/typcn_chart-line.svg',
                      title: 'Progres Ku',
                    ),
                    const SizedBox(height: 10),
                    _buildMenuItem(
                      context,
                      index: 3,
                      iconPath: 'assets/icons/tabler_logout-2.svg',
                      title: 'Keluar',
                      isLogout: true,
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

  Widget _buildMenuItem(
    BuildContext context, {
    required int index,
    required String iconPath,
    required String title,
    bool isLogout = false,
  }) {
    final isActive = selectedIndex == index;
    Color itemColor = isLogout
        ? const Color(0xFFE53935)
        : const Color(0xFF424242);
    if (isActive) itemColor = Colors.white;

    return GestureDetector(
      // 👇 INI KUNCI UTAMANYA: Memaksa seluruh area container bisa diklik!
      behavior: HitTestBehavior.opaque,
      onTap: () {
        // 1. Tutup laci/drawer dulu
        Navigator.pop(context);

        // 2. Beri jeda 150 milidetik agar laci tertutup sempurna, baru pindah halaman
        Future.delayed(const Duration(milliseconds: 150), () {
          onItemSelected(index);
        });
      },
      child: Container(
        width: double.infinity, // Mengikuti lebar penuh laci
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
}

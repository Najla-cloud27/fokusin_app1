import 'package:flutter/material.dart';
import 'package:fokusin_app1/widgets/logout_dialog.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color(0xFFF1EDE1), // Warna base drawer
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 24),
            // Header Profil
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 28,
                    backgroundImage: NetworkImage(
                      'https://i.pravatar.cc/150?img=47',
                    ), // Dummy image
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Anna syla',
                          style: GoogleFonts.poppins(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.black87,
                          ),
                        ),
                        Text(
                          'Profil Ku',
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Colors.black54,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Icon(Icons.edit_outlined, color: Color(0xFF2B5B84)),
                ],
              ),
            ),
            const SizedBox(height: 24),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Divider(color: Colors.black12, height: 1),
            ),
            const SizedBox(height: 24),

            // Menu Items
            _buildMenuItem(Icons.timer_outlined, 'Pomodoro', onTap: () {}),
            _buildMenuItem(
              Icons.format_list_bulleted,
              'List Kategori',
              onTap: () {},
            ),
            _buildMenuItem(
              Icons.show_chart_rounded,
              'Progres Ku',
              onTap: () {},
            ),

            const SizedBox(height: 16),

            // Tombol Keluar (Merah)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0),
              child: InkWell(
                onTap: () {
                  // Menutup drawer dulu baru buka dialog
                  Navigator.pop(context);
                  showDialog(
                    context: context,
                    builder: (context) => const LogoutDialog(),
                  );
                },
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                    vertical: 16,
                    horizontal: 24,
                  ),
                  decoration: const BoxDecoration(
                    color: Color(0xFFA53636), // Warna merah pudar untuk drawer
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                  ),
                  margin: const EdgeInsets.only(right: 24), // jarak ke kanan
                  child: Row(
                    children: [
                      const Icon(Icons.logout, color: Colors.white70),
                      const SizedBox(width: 16),
                      Text(
                        'Keluar',
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.white70,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            const Spacer(),

            // Bottom "Tentang kami"
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Row(
                children: [
                  const Icon(Icons.info_outline, color: Color(0xFF4A88B7)),
                  const SizedBox(width: 12),
                  Text(
                    'Tentang kami',
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.black54,
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

  Widget _buildMenuItem(IconData icon, String title, {VoidCallback? onTap}) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
        child: Row(
          children: [
            Icon(icon, color: Colors.black87),
            const SizedBox(width: 16),
            Text(
              title,
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

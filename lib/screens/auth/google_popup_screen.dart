import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GooglePopupScreen extends StatelessWidget {
  const GooglePopupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
        decoration: BoxDecoration(
          color: const Color(0xFFFFFDF8),
          borderRadius: BorderRadius.circular(24),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.g_mobiledata, size: 52, color: Colors.blue),
            const SizedBox(height: 12),

            // Judul Poppins
            Text(
              'Pilih akun Google',
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 4),

            // Subjudul Poppins
            Text(
              'Untuk melanjutkan ke Fokusin',
              style: GoogleFonts.poppins(fontSize: 14, color: Colors.black54),
            ),
            const SizedBox(height: 24),

            // List Akun Poppins
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: const CircleAvatar(
                backgroundColor: Colors.grey,
                child: Icon(Icons.person, color: Colors.white),
              ),
              title: Text(
                'Anna syla',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                ),
              ),
              subtitle: Text(
                'annasyla@gmail.com',
                style: GoogleFonts.poppins(fontSize: 13),
              ),
              onTap: () {},
            ),

            const Divider(height: 24, thickness: 1, color: Colors.black12),

            // Tambahkan akun lain Poppins
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: const Icon(Icons.group_add_outlined, color: Colors.blue),
              title: Text(
                'Tambahkan akun lain',
                style: GoogleFonts.poppins(
                  color: Colors.blue,
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                ),
              ),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}

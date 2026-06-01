import 'package:flutter/material.dart';

class GooglePopupScreen extends StatelessWidget {
  const GooglePopupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: const Color(0xFFFFF8E4),
          borderRadius: BorderRadius.circular(24),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.g_mobiledata, size: 52, color: Colors.blue),

            const SizedBox(height: 12),

            const Text(
              'Pilih akun Google',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
            ),

            const SizedBox(height: 8),

            const Text(
              'Untuk melanjutkan ke Fokusin',
              style: TextStyle(fontSize: 14),
            ),

            const SizedBox(height: 26),

            ListTile(
              leading: const CircleAvatar(),
              title: const Text('Anna syla'),
              subtitle: const Text('annasyla@gmail.com'),
              onTap: () {},
            ),

            const Divider(),

            TextButton(
              onPressed: () {},
              child: const Text('Tambahkan akun lain'),
            ),
          ],
        ),
      ),
    );
  }
}

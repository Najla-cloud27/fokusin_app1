// import 'package:flutter/material.dart';
// // Tambahkan baris ini untuk memanggil file sidebar/drawer-mu
// import 'package:flutter_svg/flutter_svg.dart';

// class KelolaKategoriPage extends StatelessWidget {
//   const KelolaKategoriPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFFFFF8E4),
//       body: SafeArea(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Padding(
//               padding: const EdgeInsets.only(top: 25, left: 16, right: 16),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   // Judul: Kelola Kategori
//                   Row(
//                     // <--- 1. Hapus kata 'const' di sini
//                     children: [
//                       SizedBox(
//                         width: 44,
//                         child: Center(
//                           child: SvgPicture.asset(
//                             'assets/icons/logo_panah.svg',
//                             width: 28,
//                             height: 28,
//                           ),
//                         ),
//                       ),

//                       // ... (Lanjutan kodemu, seperti Text 'Kelola Kategori' dan SizedBox) ...
//                       SizedBox(width: 12),
//                       Text(
//                         'Kelola Kategori',
//                         style: TextStyle(
//                           fontSize: 22,
//                           fontWeight: FontWeight.bold,
//                           color: Color(0xFF141414),
//                         ),
//                       ),
//                       // HAPUS Spacer() dan IconButton() di sini
//                     ],
//                   ),
//                   const SizedBox(height: 16),

//                   // 2. Tombol Tambah
//                   SizedBox(
//                     width: double.infinity,
//                     height: 85,
//                     child: Stack(
//                       clipBehavior: Clip.none,
//                       children: [
//                         // TOMBOL KATEGORI
//                         Positioned(
//                           bottom: 0,
//                           left: 0,
//                           right: 0,
//                           child: Container(
//                             height: 58,
//                             padding: const EdgeInsets.all(
//                               2,
//                             ), // Border kuning 2px
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(36),
//                               border: Border.all(
//                                 color: const Color(0xFFFFCB33),
//                                 width: 2,
//                               ),
//                             ),
//                             child: Container(
//                               decoration: BoxDecoration(
//                                 color: const Color(0xFF229EFF),
//                                 borderRadius: BorderRadius.circular(34),
//                               ),
//                               // Padding kiri disetel 0 karena sudah diatur oleh SizedBox di bawah
//                               padding: const EdgeInsets.only(
//                                 right: 16,
//                               ), // Ini biarkan pakai const
//                               child: Row(
//                                 children: [
//                                   SizedBox(
//                                     width: 40,
//                                     child: Center(
//                                       // 👇 2. Ikon bawaan diganti dengan asset SVG kamu (tanpa const)
//                                       child: SvgPicture.asset(
//                                         'assets/icons/Vector 1.svg', // Ganti dengan path SVG kamu
//                                         width: 20,
//                                         height: 20,
//                                         colorFilter: const ColorFilter.mode(
//                                           Color(0xFFFFCB33),
//                                           BlendMode.srcIn,
//                                         ),
//                                       ),
//                                     ),
//                                   ),

//                                   const SizedBox(width: 14),
//                                   const Text(
//                                     'Tambahkan Kategori',
//                                     style: TextStyle(
//                                       color: Colors.white,
//                                       fontSize: 16,
//                                       fontWeight: FontWeight.w600,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ),

//                         // MASKOT (Mepet kanan)
//                         Positioned(
//                           right: 12,
//                           bottom: 0,
//                           child: Image.asset(
//                             'assets/images/logo_kelola.png',
//                             height: 80,
//                             fit: BoxFit.contain,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),

//             const SizedBox(height: 24),

//             // --- GARIS PEMBATAS MEMBENTANG (#929292) ---
//             const Divider(color: Color(0xFF929292), thickness: 1, height: 1),

//             // --- KONTEN TENGAH / EMPTY STATE ---
//             Expanded(
//               child: Center(
//                 child: Opacity(
//                   opacity: 0.6,
//                   child: SizedBox(
//                     width: 201,
//                     height: 221,
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Expanded(
//                           child: Image.asset(
//                             'assets/images/logo_list.png',
//                             fit: BoxFit.contain,
//                           ),
//                         ),
//                         const SizedBox(height: 16),
//                         const Text(
//                           'Belum ada List nih, ayo isi!',
//                           textAlign: TextAlign.center,
//                           style: TextStyle(
//                             fontSize: 14,
//                             color: Color(0xFF141414),
//                             fontWeight: FontWeight.w500,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

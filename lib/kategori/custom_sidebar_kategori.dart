// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';

// class CustomSidebarKategori extends StatelessWidget {
//   final int selectedIndex;
//   final Function(int) onItemSelected;

//   const CustomSidebarKategori({
//     Key? key,
//     required this.selectedIndex,
//     required this.onItemSelected,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: 198, // Lebar kotak sidebar
//       child: Drawer(
//         backgroundColor: const Color(0xFFFFF8E4),
//         elevation: 0,
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const SizedBox(height: 63), // Top: 63px
//             // --- HUG: PROFIL & POMODORO (Lebar 186, Tinggi 270) ---
//             SizedBox(
//               width: 186,
//               height: 270,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   // 1. PROFIL HUG (Width: 173, Height: 62)
//                   Container(
//                     width: 173,
//                     height: 62,
//                     margin: const EdgeInsets.only(left: 13),
//                     child: Row(
//                       children: [
//                         // --- FOTO PROFIL ---
//                         const CircleAvatar(
//                           radius: 24,
//                           backgroundColor: Colors.grey,
//                           backgroundImage: AssetImage(
//                             'assets/images/profil.png',
//                           ),
//                         ),
//                         const SizedBox(width: 12), // Jarak Avatar ke Teks
//                         // Teks Nama & Profil
//                         const Expanded(
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Text(
//                                 'Anna syla',
//                                 maxLines: 1,
//                                 overflow: TextOverflow.ellipsis,
//                                 style: TextStyle(
//                                   fontSize: 16,
//                                   fontWeight: FontWeight.bold,
//                                   color: Color(0xFF1A1A1A),
//                                 ),
//                               ),
//                               SizedBox(height: 2),
//                               Text(
//                                 'Profil Ku',
//                                 maxLines: 1,
//                                 overflow: TextOverflow.ellipsis,
//                                 style: TextStyle(
//                                   fontSize: 12,
//                                   color: Colors.grey,
//                                   fontWeight:
//                                       FontWeight.bold, // 👇 Tambahkan baris ini
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                         const SizedBox(width: 22),

//                         // Ikon Pensil
//                         SvgPicture.asset(
//                           'assets/icons/mingcute_pencil.svg',
//                           width: 28,
//                           height: 28,
//                           colorFilter: const ColorFilter.mode(
//                             Color(0xFF1B7ECC),
//                             BlendMode.srcIn,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),

//                   // --- GARIS BARU DI BAWAH PROFIL ---
//                   const SizedBox(height: 16),
//                   const Padding(
//                     padding: EdgeInsets.symmetric(horizontal: 16.0),
//                     child: Divider(
//                       color: Color(0xFF141414), // Sama dengan footer
//                       thickness: 1,
//                       height: 1, // Memastikan tingginya mutlak 1px
//                     ),
//                   ),
//                   const SizedBox(height: 17),

//                   // 2. MENU ITEM HUG (Width: 186, Height: 174, Gap 10)
//                   SizedBox(
//                     width: 186,
//                     height: 174,
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         // 👇 TINGGAL GANTI PATH ASSET-NYA DI SINI 👇
//                         _buildMenuItem(
//                           context,
//                           index: 0,
//                           iconPath:
//                               'assets/icons/Vector.svg', // Ganti dengan path SVG pomodoro kamu
//                           title: 'Pomodoro',
//                         ),
//                         const SizedBox(height: 10),
//                         _buildMenuItem(
//                           context,
//                           index: 1,
//                           iconPath:
//                               'assets/icons/list_star.svg', // Ganti dengan path SVG list kategori kamu
//                           title: 'List Kategori',
//                         ),
//                         const SizedBox(height: 10),
//                         _buildMenuItem(
//                           context,
//                           index: 2,
//                           iconPath:
//                               'assets/icons/typcn_chart-line.svg', // Ganti dengan path SVG progres kamu
//                           title: 'Progres Ku',
//                         ),
//                         const SizedBox(height: 10),
//                         _buildMenuItem(
//                           context,
//                           index: 3,
//                           iconPath:
//                               'assets/icons/tabler_logout-2.svg', // Ganti dengan path SVG logout kamu
//                           title: 'Keluar',
//                           isLogout: true,
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),

//             // Spacer mendorong footer "Tentang Kami" agar terus berada di bagian bawah
//             const Spacer(),

//             // --- FOOTER TENTANG KAMI ---
//             const Padding(
//               padding: EdgeInsets.symmetric(horizontal: 16.0),
//               child: Divider(color: Color(0xFF626262), thickness: 1),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(left: 24, bottom: 24, top: 16),
//               child: Row(
//                 children: [
//                   Container(
//                     padding: const EdgeInsets.all(6),
//                     decoration: const BoxDecoration(
//                       // color: Colors.white,
//                       shape: BoxShape.circle,
//                     ),
//                     // Jika footer ini mau diganti asset juga, ubah Icon jadi SvgPicture.asset seperti yang lain
//                     child: SvgPicture.asset(
//                       'assets/icons/logo_panah.svg',
//                       // color: Color(0xFF229EFF),
//                       width: 20,
//                       height: 20,
//                     ),
//                   ),
//                   const SizedBox(width: 12),
//                   const Text(
//                     'Tentang kami',
//                     style: TextStyle(
//                       fontSize: 14,
//                       color: Colors.grey,
//                       fontWeight: FontWeight.w500,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   // 👇 PERUBAHAN UTAMA ADA DI SINI 👇
//   Widget _buildMenuItem(
//     BuildContext context, {
//     required int index,
//     required String iconPath, // Ubah dari IconData jadi String
//     required String title,
//     bool isLogout = false,
//   }) {
//     final isActive = selectedIndex == index;
//     Color itemColor = isLogout
//         ? const Color(0xFFE53935)
//         : const Color(0xFF424242);
//     if (isActive) itemColor = Colors.white;

//     return GestureDetector(
//       onTap: () {
//         onItemSelected(index);
//         Navigator.pop(context); // Menutup drawer saat diklik
//       },
//       child: Container(
//         width: 186, // Lebar pill pas 186px
//         height: 36, // Tinggi pill 36px
//         decoration: BoxDecoration(
//           color: isActive ? const Color(0xFF1B7ECC) : Colors.transparent,
//           borderRadius: const BorderRadius.only(
//             topRight: Radius.circular(18),
//             bottomRight: Radius.circular(18),
//           ),
//         ),
//         padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
//         child: Row(
//           children: [
//             // Ubah widget Icon bawaan menjadi SvgPicture
//             SvgPicture.asset(
//               iconPath,
//               width: 20,
//               height: 20,
//               colorFilter: ColorFilter.mode(
//                 itemColor, // Warnanya otomatis ngikutin text-nya (hitam, putih, atau merah)
//                 BlendMode.srcIn,
//               ),
//             ),
//             const SizedBox(width: 12),
//             Text(
//               title,
//               style: TextStyle(
//                 color: itemColor,
//                 // 👇 Ubah baris fontWeight menjadi seperti ini agar selalu tebal
//                 fontWeight: FontWeight.bold,
//                 fontSize: 14,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

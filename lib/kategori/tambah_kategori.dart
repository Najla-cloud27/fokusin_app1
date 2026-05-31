// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart'; // 👈 Jangan lupa import ini

// class TambahKategori extends StatefulWidget {
//   const TambahKategori({Key? key}) : super(key: key);

//   @override
//   State<TambahKategori> createState() => _TambahKategoriState();
// }

// class _TambahKategoriState extends State<TambahKategori> {
//   // Daftar 24 Warna sesuai spesifikasi Figma
//   final List<Color> categoryColors = [
//     const Color(0xFFF16E96),
//     const Color(0xFFFC9390),
//     const Color(0xFFAB82A4),
//     const Color(0xFF7759A3),
//     const Color(0xFF76BBC0),
//     const Color(0xFF899064),
//     const Color(0xFFDB3E8D),
//     const Color(0xFFFFAFEC),
//     const Color(0xFFF5C45D),
//     const Color(0xFF66A4ED),
//     const Color(0xFFA609F0),
//     const Color(0xFF000180),
//     const Color(0xFF006EE9),
//     const Color(0xFF83E7FF),
//     const Color(0xFFD1FFA4),
//     const Color(0xFFB1C228),
//     const Color(0xFF535C1D),
//     const Color(0xFFFA6B41),
//     const Color(0xFFFC3C31),
//     const Color(0xFFFE8616),
//     const Color(0xFFA7FE3D),
//     const Color(0xFF00B6FF),
//     const Color(0xFF2B6B6D),
//     const Color(0xFF7B46F8),
//   ];

//   int? selectedColorIndex; // Untuk menyimpan status warna mana yang diklik

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFFFFF8E4),
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         // Tombol Back
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back, color: Color(0xFF006EE9)),
//           onPressed: () => Navigator.pop(context),
//         ),
//       ),
//       // Gunakan GestureDetector agar keyboard tertutup jika user tap area kosong
//       body: GestureDetector(
//         onTap: () => FocusScope.of(context).unfocus(),
//         child: SingleChildScrollView(
//           padding: const EdgeInsets.symmetric(
//             horizontal: 24.0,
//           ), // Responsif padding L/R
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const SizedBox(height: 20),

//               // --- AREA INPUT (STACK UNTUK LOGO & CONTAINER) ---
//               Stack(
//                 clipBehavior: Clip.none,
//                 alignment: Alignment.topCenter,
//                 children: [
//                   // Container Biru Input
//                   Container(
//                     margin: const EdgeInsets.only(
//                       top: 30,
//                     ), // Memberi ruang untuk logo di atas
//                     padding: const EdgeInsets.only(
//                       top: 40, // Padding atas dilebarkan untuk logo
//                       left: 20,
//                       right: 20,
//                       bottom: 20,
//                     ),
//                     decoration: BoxDecoration(
//                       color: const Color(0xFF229EFF),
//                       borderRadius: BorderRadius.circular(16),
//                     ),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         const Text(
//                           'Nama kategori',
//                           style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 12,
//                             fontWeight: FontWeight.w500,
//                           ),
//                         ),
//                         // Input Field
//                         const TextField(
//                           style: TextStyle(color: Colors.white, fontSize: 16),
//                           cursorColor: Colors.white,
//                           textInputAction: TextInputAction.go,
//                           decoration: InputDecoration(
//                             hintText: 'Isi Kategori',
//                             hintStyle: TextStyle(
//                               color: Colors.white70,
//                               fontSize: 16,
//                             ),
//                             contentPadding: EdgeInsets.symmetric(vertical: 8),
//                             enabledBorder: UnderlineInputBorder(
//                               borderSide: BorderSide(
//                                 color: Colors.white,
//                                 width: 1,
//                               ),
//                             ),
//                             focusedBorder: UnderlineInputBorder(
//                               borderSide: BorderSide(
//                                 color: Colors.white,
//                                 width: 2,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),

//                   // Logo Tengah Atas
//                   Positioned(
//                     top: 0,
//                     child: Container(
//                       width: 60,
//                       height: 60,
//                       padding: const EdgeInsets.all(4), // Jarak border
//                       decoration: const BoxDecoration(
//                         color: Color(0xFF229EFF), // Latar lingkaran logo
//                         shape: BoxShape.circle,
//                         boxShadow: [
//                           BoxShadow(
//                             color: Color(0xFFFFE085), // Warna shadow light
//                             blurRadius: 4, // Blur 4px
//                             offset: Offset(0, 2), // Sedikit turun agar natural
//                           ),
//                         ],
//                       ),
//                       child: Center(
//                         // 👇 INI BAGIAN YANG SUDAH DIGANTI MENJADI SVG 👇
//                         child: SvgPicture.asset(
//                           'assets/icons/Logo white.svg', // 👈 Ganti dengan nama file SVG kamu
//                           width: 32,
//                           height: 38,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),

//               const SizedBox(height: 40),

//               Container(
//                 padding: const EdgeInsets.symmetric(
//                   horizontal: 16,
//                   vertical: 6,
//                 ),
//                 decoration: BoxDecoration(
//                   color: const Color(0xFF229EFF),
//                   borderRadius: BorderRadius.circular(7),
//                   boxShadow: const [
//                     BoxShadow(
//                       color: Color(0xFFFFE085),
//                       blurRadius: 4,
//                       offset: Offset(0, 2),
//                     ),
//                   ],
//                 ),
//                 child: const Text(
//                   'Pilih Warna',
//                   style: TextStyle(
//                     color: Color(0xFFFFF8E4),
//                     fontSize: 14,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),

//               const SizedBox(height: 20),

//               // Grid 24 Warna (Responsif 6 Kolom)
//               GridView.builder(
//                 shrinkWrap:
//                     true, // Wajib agar tidak error di dalam SingleChildScrollView
//                 physics:
//                     const NeverScrollableScrollPhysics(), // Scroll mengikuti layar utama
//                 gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: 6, // 6 Kolom
//                   crossAxisSpacing: 16, // Jarak antar kolom
//                   mainAxisSpacing: 16, // Jarak antar baris
//                   childAspectRatio: 1.0, // Bentuk kotak presisi
//                 ),
//                 itemCount: categoryColors.length,
//                 itemBuilder: (context, index) {
//                   final color = categoryColors[index];
//                   final isSelected = selectedColorIndex == index;

//                   return GestureDetector(
//                     onTap: () {
//                       setState(() {
//                         selectedColorIndex = index;
//                       });
//                     },
//                     child: AnimatedContainer(
//                       duration: const Duration(milliseconds: 200),
//                       decoration: BoxDecoration(
//                         color: color,
//                         borderRadius: BorderRadius.circular(
//                           isSelected ? 16 : 8,
//                         ), // Membulat jika dipilih
//                         border: isSelected
//                             ? Border.all(color: Colors.black87, width: 3)
//                             : null,
//                       ),
//                     ),
//                   );
//                 },
//               ),

//               const SizedBox(height: 40), // Jarak napas bawah sebelum keyboard
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

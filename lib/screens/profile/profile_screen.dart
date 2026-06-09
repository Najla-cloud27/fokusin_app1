import 'dart:ui'; // Wajib untuk efek bunderan Blur figma
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool _isNotificationOn = false;

  // Warna Akurat Sesuai Desain Figma
  final Color _bgColor = const Color(0xFFFDF7E7); // Krem Latar Belakang
  final Color _cardColor = const Color(0xFFFDF7E7);
  final Color _textColor = const Color(0xFF2D2D2D);

  // Efek Bayangan Lembut untuk Kartu Menu Pengaturan
  List<BoxShadow> get _figmaCardShadow => [
    BoxShadow(
      color: const Color(0xFF2574B2).withOpacity(0.12), // Glow biru tipis figma
      blurRadius: 16,
      spreadRadius: 0,
      offset: const Offset(0, 6),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _bgColor,
      // 1. APP BAR
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: MouseRegion(
          cursor: SystemMouseCursors.click,
          child: IconButton(
            icon: SvgPicture.asset(
              'assets/icons/arrow_back_blue.svg',
              width: 24,
              height: 24,
            ),
            onPressed: () {
              if (context.canPop()) {
                context.pop();
              } else {
                context.go('/home');
              }
            },
          ),
        ),
        title: Text(
          'Profil',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: _textColor,
          ),
        ),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 2. SEGMEN AURA LENGKUNG U-SHAPE (DIRENDERING LEWAT KODE)
            SizedBox(
              height: 350,
              width: double.infinity,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  // Menggambar Efek Wave Mesh Gradient Figma secara 100% Real-time
                  Positioned(
                    top: 100,
                    left: 0,
                    right: 0,
                    child: ImageFiltered(
                      imageFilter: ImageFilter.blur(
                        sigmaX: 40,
                        sigmaY: 40,
                        tileMode: TileMode.decal,
                      ),
                      child: CustomPaint(
                        size: Size(MediaQuery.of(context).size.width, 180),
                        painter: FigmaAuraPainter(),
                      ),
                    ),
                  ),

                  // 3. FOTO PROFIL & TOMBOL KAMERA
                  Positioned(
                    // avatar
                    top: 80,
                    child: SizedBox(
                      width: 140,
                      height: 140,
                      child: Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.white, width: 3),
                            ),
                            child: const CircleAvatar(
                              radius: 66,
                              backgroundImage: AssetImage(
                                'assets/images/profil.png',
                              ),
                            ),
                          ),
                          // Badge Kamera Pojok Kanan Bawah
                          Positioned(
                            bottom: 2,
                            right: 2,
                            child: Container(
                              padding: const EdgeInsets.all(2),
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                              ),
                              child: SvgPicture.asset(
                                'assets/icons/icon_camera.svg',
                                width: 32,
                                height: 32,
                                errorBuilder: (context, error, stackTrace) {
                                  return Container(
                                    padding: const EdgeInsets.all(6),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: const Color(0xFF2574B2),
                                        width: 1.5,
                                      ),
                                    ),
                                    child: const Icon(
                                      Icons.camera_alt_outlined,
                                      color: Color(0xFF2574B2),
                                      size: 16,
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // 4. ICON MASCOT PENGATURAN
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Row(
                children: [
                  Image.asset(
                    'assets/images/login_character.png',
                    width: 28,
                    height: 28,
                    errorBuilder: (context, error, stackTrace) {
                      return const Icon(
                        Icons.settings_outlined,
                        color: Color(0xFF2574B2),
                        size: 24,
                      );
                    },
                  ),
                  const SizedBox(width: 10),
                  Text(
                    'Pengaturan',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: _textColor,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // 5. INPUT KOTAK NAMA (ANNA SYLA)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Container(
                decoration: BoxDecoration(
                  color: _cardColor,
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(
                    color: const Color(0xFF2574B2).withOpacity(0.18),
                    width: 1.2,
                  ),
                  boxShadow: _figmaCardShadow,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 22.0,
                    vertical: 16.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Anna syla',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: _textColor,
                        ),
                      ),
                      SvgPicture.asset(
                        'assets/icons/mingcute_pencil.svg',
                        width: 20,
                        height: 20,
                        colorFilter: const ColorFilter.mode(
                          Color(0xFF2574B2),
                          BlendMode.srcIn,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            const SizedBox(height: 14),

            // 6. INPUT KOTAK EMAIL
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: _cardColor,
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(
                    color: const Color(0xFF2574B2).withOpacity(0.18),
                    width: 1.2,
                  ),
                  boxShadow: _figmaCardShadow,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 22.0,
                    vertical: 16.0,
                  ),
                  child: Text(
                    'annasylaa@gmail.com',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: _textColor.withOpacity(0.6),
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 14),

            // 7. KOTAK GABUNGAN NOTIFIKASI (CUSTOM TOGGLE 100% MATCH FIGMA)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Container(
                decoration: BoxDecoration(
                  color: _cardColor,
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(
                    color: const Color(0xFF2574B2).withOpacity(0.18),
                    width: 1.2,
                  ),
                  boxShadow: _figmaCardShadow,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 22.0,
                    vertical: 8.0,
                  ),
                  child: ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: const Icon(
                      Icons.notifications_none_rounded,
                      color: Colors.black87,
                      size: 24,
                    ),
                    title: Text(
                      'Notifikasi',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: _textColor,
                      ),
                    ),

                    // --- INI ADALAH CUSTOM TOGGLE SWITCH BARU ---
                    trailing: GestureDetector(
                      onTap: () {
                        setState(() {
                          _isNotificationOn = !_isNotificationOn;
                        });
                      },
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 250),
                        curve: Curves.easeInOut,
                        width: 48, // Lebar kotak kapsul
                        height: 26, // Tinggi kotak kapsul
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: _isNotificationOn
                              ? const Color(0xFF2574B2) // Biru saat ON
                              : const Color(0xFFD9D9D9), // Abu-abu saat OFF
                        ),
                        padding: const EdgeInsets.all(3),
                        child: AnimatedAlign(
                          duration: const Duration(milliseconds: 250),
                          curve: Curves.easeInOut,
                          alignment: _isNotificationOn
                              ? Alignment.centerRight
                              : Alignment.centerLeft,
                          child: Container(
                            width: 20, // Lebar lingkaran putih
                            height: 20, // Tinggi lingkaran putih
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.15),
                                  blurRadius: 4,
                                  offset: const Offset(0, 2),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),

                    // ---------------------------------------------
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}

// 🎨 PELUKIS GRAFIS UNTUK LENGKUNGAN AURA BIRU FIGMA
class FigmaAuraPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color =
          const Color(
            0xFF2574B2,
          ) // Biru Khas Fokusin solid tanpa di-opacity lagi di sini
      ..style = PaintingStyle.stroke
      ..strokeWidth =
          110 // Dipertebal dari 55 agar saat kena blur birunya tidak hilang/pucat
      ..strokeCap = StrokeCap.round;

    final path = Path();

    path.moveTo(-100, 20);

    path.quadraticBezierTo(
      size.width / 2,
      size.height * 1.8,
      size.width + 100,
      20,
    );

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

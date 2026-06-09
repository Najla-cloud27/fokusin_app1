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
  // Variabel untuk Switch Notifikasi
  bool _isNotificationOn = false;

  // =========================================================
  // 🛠️ TAMBAHAN LOGIC UI UNTUK EDIT NAMA
  // ALASAN: Kita butuh controller untuk menyimpan teks yang diketik user,
  // dan variabel boolean untuk menandai apakah user sedang dalam mode "edit" atau tidak.
  // =========================================================
  bool _isEditingName = false;
  final TextEditingController _nameController = TextEditingController(
    text: 'Anna syla',
  );

  @override
  void dispose() {
    _nameController
        .dispose(); // Jangan lupa dibuang saat halaman ditutup agar memori tidak bocor
    super.dispose();
  }

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

            // 5. INPUT KOTAK NAMA (DIPERBARUI DENGAN FITUR EDIT UI)
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
                      // PERUBAHAN: TEXT MENJADI TEXTFIELD SAAT MODE EDIT
                      Expanded(
                        child: _isEditingName
                            ? TextField(
                                controller: _nameController,
                                autofocus:
                                    true, // Otomatis fokus dan memunculkan keyboard
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: _textColor,
                                ),
                                decoration: const InputDecoration(
                                  isDense: true,
                                  contentPadding: EdgeInsets.zero,
                                  border: InputBorder
                                      .none, // Hilangkan garis bawah TextField
                                ),
                                onSubmitted: (value) {
                                  // Simpan jika keyboard dienter
                                  setState(() {
                                    _isEditingName = false;
                                  });
                                },
                              )
                            : Text(
                                _nameController
                                    .text, // Ambil nama dari Controller
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: _textColor,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                      ),
                      const SizedBox(width: 10),

                      // TOMBOL PENSIL/CENTANG
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            // Balikkan keadaan: dari edit ke save, atau dari save ke edit
                            _isEditingName = !_isEditingName;
                          });
                        },
                        child: _isEditingName
                            ? const Icon(
                                Icons
                                    .check_circle_outline, // Munculkan icon centang jika sedang edit
                                color: Color(0xFF2574B2),
                                size: 22,
                              )
                            : SvgPicture.asset(
                                'assets/icons/mingcute_pencil.svg',
                                width: 20,
                                height: 20,
                                colorFilter: const ColorFilter.mode(
                                  Color(0xFF2574B2),
                                  BlendMode.srcIn,
                                ),
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

            // 7. KOTAK GABUNGAN NOTIFIKASI
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

                    // 1. POSISI KIRI (Leading) - MENGGUNAKAN ICON BAWAAN FLUTTER
                    leading: const Icon(
                      Icons.notifications_none_rounded,
                      color: Colors.black87,
                      size: 26, // Ukuran disesuaikan agar proporsional
                    ),

                    // 2. POSISI TENGAH
                    title: const Text(
                      'Notifikasi',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),

                    /// 3. POSISI KANAN (Trailing)
                    trailing: Switch(
                      value: _isNotificationOn,
                      // Warna saat tombol NYALA (ON)
                      activeColor: Colors.white, // Warna lingkaran/tombol
                      activeTrackColor: const Color(
                        0xFF2574B2,
                      ), // Warna lintasan (biru tema aplikasimu)
                      // Warna saat tombol MATI (OFF)
                      inactiveThumbColor: Colors.grey.shade600,
                      inactiveTrackColor: Colors.grey.shade300,

                      onChanged: (value) {
                        setState(() {
                          _isNotificationOn = value;
                        });
                      },
                    ),
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
      ..color = const Color(0xFF2574B2)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 110
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

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fokusin_app1/drawer/custom_sidebar_kategori.dart';
import 'package:fokusin_app1/screens/kategori/kelola_kategori_page.dart';
import 'package:fokusin_app1/screens/progress/progress_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Key untuk mengontrol pembukaan Drawer kiri & kanan
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  // State Manajemen untuk Latar Belakang (Background)
  bool _isImageBg = true;
  String _currentBgPath = 'assets/images/background_1.png';
  Color _currentBgColor = const Color(0xFFFFCA28);

  // Warna dasar krem untuk background sidebar/drawer
  final Color _drawerBgColor = const Color(0xFFFDF6E3);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      extendBodyBehindAppBar: true,

      // ==========================================
      // APP BAR
      // ==========================================
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Pomodoro',
          style: TextStyle(
            fontFamily: 'Poppins',
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: SvgPicture.asset(
            'assets/icons/logo_white.svg',
            width: 28,
            height: 28,
          ),
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer();
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert, color: Colors.white, size: 28),
            onPressed: () {
              _scaffoldKey.currentState?.openEndDrawer();
            },
          ),
          const SizedBox(width: 8),
        ],
      ),

      // ==========================================
      // SIDEBAR KIRI (Drawer - Profil & Navigasi)
      // ==========================================
      drawer: CustomSidebarKategori(
        selectedIndex: 0,
        onItemSelected: (index) {
          if (index == 0) {
            // 1. Pomodoro: Sudah di Home, biarkan laci tertutup sendiri
          } else if (index == 1) {
            // 2. List Kategori: Pindah ke KelolaKategoriPage
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const KelolaKategoriPage(),
              ),
            );
          } else if (index == 2) {
            // 3. Progres Ku: Pindah ke ProgressScreen (Ubah bagian ini!) 👇
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const ProgressScreen()),
            );
          } else if (index == 3) {
            // 4. Keluar: Dikecualikan (Sesuai permintaanmu, tidak melakukan navigasi apa-apa)
          }
        },
      ),

      // ==========================================
      // SIDEBAR KANAN (EndDrawer - Pengubah Latar Belakang)
      // ==========================================
      endDrawer: Drawer(
        backgroundColor: _drawerBgColor,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    // INI ICON FILE MILIKMU YANG BARU
                    SvgPicture.asset(
                      'assets/icons/Vector_latarBelakang.svg',
                      width: 26,
                      height: 26,
                    ),
                    // Pindahkan kata const ke sini
                    const SizedBox(width: 12),
                    const Text(
                      // Pindahkan kata const ke sini juga
                      'Latar Belakang',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                const Divider(color: Colors.black12, thickness: 1),
                const SizedBox(height: 15),
                const Text(
                  'Pilih latar belakang bawaan',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 15,
                    color: Colors.black54,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 20),

                // Opsi Gambar
                _buildImageOption('assets/images/background_1.png'),
                const SizedBox(height: 15),
                _buildImageOption('assets/images/background_2.png'),

                const SizedBox(height: 25),
                const Text(
                  'Atau gunakan warna solid',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 15,
                    color: Colors.black54,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 15),

                // Opsi Warna Solid (Sudah Sesuai 100% dengan #FFCB33, #FFF8E4, #EC8DBE)
                // Opsi Warna Solid (Berjejer ke bawah sesuai Figma)
                Column(
                  children: [
                    _buildColorOption(
                      const Color(0xFFFFCB33),
                    ), // #FFCB33 - Kuning
                    const SizedBox(height: 12), // Jarak ke bawah
                    _buildColorOption(
                      const Color(0xFFFFF8E4),
                    ), // #FFF8E4 - Krem
                    const SizedBox(height: 12),
                    _buildColorOption(
                      const Color(0xFFEC8DBE),
                    ), // #EC8DBE - Pink
                  ],
                ),
              ],
            ),
          ),
        ),
      ),

      // ==========================================
      // BODY UTAMA (Homepage Konten)
      // ==========================================
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: _isImageBg ? null : _currentBgColor,
          image: _isImageBg
              ? DecorationImage(
                  image: AssetImage(_currentBgPath),
                  fit: BoxFit.cover,
                )
              : null,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Lingkaran Besar Timer
            Container(
              width: 250,
              height: 250,
              decoration: BoxDecoration(
                color: Colors.blue.withOpacity(0.8),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.15),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: const Center(
                child: Text(
                  '00:00',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 64,
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 40),

            // Tombol Batalkan
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black.withOpacity(0.35),
                foregroundColor: Colors.white,
                elevation: 0,
                padding: const EdgeInsets.symmetric(
                  horizontal: 32,
                  vertical: 14,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                  side: const BorderSide(color: Colors.white60, width: 1),
                ),
              ),
              icon: SvgPicture.asset(
                'assets/icons/cancel_white.svg',
                width: 16,
                height: 16,
              ),
              label: const Text(
                'Batalkan',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }

  // ini tuh bagian yang atur asset path gmbar
  Widget _buildImageOption(String assetPath) {
    bool isCurrent = _isImageBg && _currentBgPath == assetPath;

    return GestureDetector(
      onTap: () {
        setState(() {
          _isImageBg = true;
          _currentBgPath = assetPath;
        });
      },
      child: Container(
        height: 75,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isCurrent ? Colors.blue : Colors.black12,
            width: isCurrent ? 3 : 1,
          ),
          image: DecorationImage(
            image: AssetImage(assetPath),
            fit: BoxFit.cover,
          ),
        ),
        child: isCurrent
            ? const Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: EdgeInsets.all(4.0),
                  child: CircleAvatar(
                    backgroundColor: Colors.blue,
                    radius: 10,
                    child: Icon(Icons.check, size: 12, color: Colors.white),
                  ),
                ),
              )
            : null,
      ),
    );
  }

  Widget _buildColorOption(Color color) {
    bool isCurrent = !_isImageBg && _currentBgColor == color;

    return GestureDetector(
      onTap: () {
        setState(() {
          _isImageBg = false;
          _currentBgColor = color;
        });
      },
      child: Container(
        height: 52, // Tinggi sesuai dengan desain Figma
        width: double.infinity, // Lebar memanjang mengisi penuh area drawer
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(
            12,
          ), // Ujungnya dibikin melengkung
          border: Border.all(
            color: isCurrent ? const Color(0xFF229EFF) : Colors.black12,
            width: isCurrent ? 3 : 1,
          ),
        ),
        child: isCurrent
            ? const Center(
                child: Icon(
                  Icons.check,
                  size: 24,
                  // Pakai warna hitam transparan supaya centangnya terlihat jelas di warna kuning/krem yang terang
                  color: Colors.black54,
                ),
              )
            : null,
      ),
    );
  }
}

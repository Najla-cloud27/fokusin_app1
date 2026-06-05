import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
      drawer: Drawer(
        backgroundColor: _drawerBgColor,
        child: Column(
          children: [
            SafeArea(
              bottom: false,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    const CircleAvatar(
                      radius: 30,
                      backgroundColor: Color(0xFF8FD0FF), // Warna cadangan
                      backgroundImage: AssetImage('assets/images/profil.png'),
                    ),
                    const SizedBox(width: 15),
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Anna syla',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                            maxLines: 1, // Pengaman agar tidak turun ke bawah
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            'Profil Ku',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              color: Colors.black54,
                              fontSize: 14,
                            ),
                            maxLines: 1, // Pengaman agar tidak turun ke bawah
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                    // TOMBOL EDIT DENGAN IKON CUSTOM & PENGAMAN
                    IconButton(
                      icon: SvgPicture.asset(
                        'assets/icons/mingcute_pencil.svg', // <-- Path, ejaan, dan ekstensi sudah benar
                        width: 24,
                        height: 24,
                      ),
                      onPressed: () {
                        // Aksi ketika tombol edit ditekan
                      },
                    ),
                  ],
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Divider(color: Colors.black12, thickness: 1),
            ),
            const SizedBox(height: 10),

            // Menu Items/ Menu SIdebar KIRI
            _buildLeftDrawerItem(
              title: 'Pomodoro',
              svgPath: 'assets/icons/Vector.svg',
              isSelected: true,
            ),
            _buildLeftDrawerItem(
              title: 'List Kategori',
              svgPath: 'assets/icons/list_star.svg',
            ),
            _buildLeftDrawerItem(
              title: 'Progres Ku',
              svgPath: 'assets/icons/icon_progress.svg',
            ),
            _buildLeftDrawerItem(
              title: 'Keluar',
              svgPath: 'assets/icons/tabler_logout-2.svg',
              isRed: true,
            ),

            const Spacer(),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Divider(color: Colors.black12, thickness: 1),
            ),
            ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 30.0),
              leading: SvgPicture.asset(
                'assets/icons/logo_blue.svg',
                width: 24,
                height: 24,
              ),
              title: const Text(
                'Tentang kami',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  color: Colors.black54,
                  fontWeight: FontWeight.w500,
                ),
              ),
              onTap: () {},
            ),
            const SizedBox(height: 20),
          ],
        ),
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
                const Row(
                  children: [
                    Icon(Icons.wallpaper, color: Colors.blue, size: 26),
                    SizedBox(width: 12),
                    Text(
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

                // Opsi Warna
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildColorOption(const Color(0xFFFFCA28)),
                    _buildColorOption(const Color(0xFFFDF6E3)),
                    _buildColorOption(const Color(0xFFF48FB1)),
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

  // ==========================================
  // HELPER WIDGETS
  // ==========================================

  Widget _buildLeftDrawerItem({
    required String title,
    String? svgPath,
    IconData? iconData,
    bool isSelected = false,
    bool isRed = false,
  }) {
    Color itemColor = isSelected
        ? Colors.white
        : (isRed ? Colors.red : Colors.black87);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 4.0),
      child: Container(
        decoration: isSelected
            ? BoxDecoration(
                color: const Color(0xFF1976D2),
                borderRadius: BorderRadius.circular(30),
              )
            : null,
        child: ListTile(
          leading: svgPath != null
              ? SvgPicture.asset(
                  svgPath,
                  width: 24,
                  height: 24,
                  colorFilter: ColorFilter.mode(itemColor, BlendMode.srcIn),
                )
              : Icon(iconData, color: itemColor),
          title: Text(
            title,
            style: TextStyle(
              fontFamily: 'Poppins',
              color: itemColor,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
              fontSize: 16,
            ),
          ),
          onTap: () {},
        ),
      ),
    );
  }

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
        height: 60,
        width: 75,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isCurrent ? Colors.blue : Colors.black12,
            width: isCurrent ? 3 : 1,
          ),
        ),
        child: isCurrent
            ? const Center(
                child: CircleAvatar(
                  backgroundColor: Colors.blue,
                  radius: 12,
                  child: Icon(Icons.check, size: 14, color: Colors.white),
                ),
              )
            : null,
      ),
    );
  }
}

// lib/screens/onboarding/onboarding_screen.dart

import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

// ================= IMPORT ASSET PATHS =================
import '../../core/constants/asset_paths.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  // ================= COLORS =================
  static const Color _cream = Color(0xFFFFF8E4);

  static const Color _blue = Color(0xFF229EFF);

  static const Color _dark = Color(0xFF1A1A2E);

  static const Color _yellow = Color(0xFFFFD600);

  // ================= DATA ONBOARDING =================
  static const List<_OBData> _pages = <_OBData>[
    // ===== WELCOME =====
    _OBData(
      titleLines: <String>['Selamat datang'],

      titleWithLogo: true,

      subtitle: 'Fokus lebih baik, capai tujuanmu.\nAyo Mulai!',

      character: AssetPaths.loginCharacter,

      waveImage: AssetPaths.waveWelcome,
    ),

    // ===== ONBOARDING 1 =====
    _OBData(
      titleLines: <String>['Susah fokus saat\nbelajar?'],

      titleWithLogo: false,

      subtitle: 'Banyak distraksi jadi bikin\ntugas jadi tertunda.',

      character: AssetPaths.gambar2,

      waveImage: AssetPaths.waveOnboarding1,
    ),

    // ===== ONBOARDING 2 =====
    _OBData(
      titleLines: <String>['Fokus sedikit, tapi\nkonsisten'],

      titleWithLogo: false,

      subtitle: 'Gunakan metode Pomodoro untuk\nbantu kamu tetap on track',

      character: AssetPaths.gambar3,

      waveImage: AssetPaths.waveOnboarding2,
    ),

    // ===== ONBOARDING 3 =====
    _OBData(
      titleLines: <String>['Capai targetmu\nsetiap hari'],

      titleWithLogo: false,

      subtitle: 'Bangun kebiasaan fokus\ndan selesaikan tugasmu.',

      character: AssetPaths.gambar4,

      waveImage: AssetPaths.waveOnboarding3,
    ),
  ];

  // ================= STATE =================
  int _page = 0;

  final PageController _ctrl = PageController();

  Timer? _timer;

  // ================= INIT =================
  @override
  void initState() {
    super.initState();

    // ================= STATUS BAR =================
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,

        statusBarIconBrightness: Brightness.dark,

        systemNavigationBarColor: _cream,

        systemNavigationBarIconBrightness: Brightness.dark,
      ),
    );

    // ================= AUTO SLIDE =================
    _startTimer();
  }

  // ================= AUTO SLIDE =================
  void _startTimer() {
    _timer?.cancel();

    _timer = Timer.periodic(const Duration(seconds: 3), (_) {
      if (!mounted) return;

      // ================= NEXT PAGE =================
      if (_page < _pages.length - 1) {
        _goTo(_page + 1);
      } else {
        // ================= GO LOGIN =================
        _timer?.cancel();

        context.go('/login');
      }
    });
  }

  // ================= GO TO PAGE =================
  void _goTo(int index) {
    setState(() => _page = index);

    _ctrl.animateToPage(
      index,

      duration: const Duration(milliseconds: 500),

      curve: Curves.easeInOutCubic,
    );
  }

  // ================= ON PAGE CHANGED =================
  void _onPageChanged(int index) {
    setState(() => _page = index);

    _startTimer();
  }

  // ================= DISPOSE =================
  @override
  void dispose() {
    _timer?.cancel();

    _ctrl.dispose();

    super.dispose();
  }

  // ================= UI =================
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _cream,

      body: SafeArea(
        child: Stack(
          children: [
            // ================= PAGE VIEW =================
            PageView.builder(
              controller: _ctrl,

              onPageChanged: _onPageChanged,

              itemCount: _pages.length,

              itemBuilder: (context, index) {
                return _buildPage(context, _pages[index]);
              },
            ),

            // ================= INDICATOR =================
            Positioned(
              bottom: 34,
              left: 0,
              right: 0,

              child: Center(
                child: _SpinnerIndicator(
                  page: _page,

                  total: _pages.length,

                  blue: _blue,

                  yellow: _yellow,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ================= PAGE =================
  Widget _buildPage(BuildContext context, _OBData data) {
    return Stack(
      children: [
        // ================= BACKGROUND WAVE =================
        Positioned.fill(child: Image.asset(data.waveImage, fit: BoxFit.cover)),

        // ================= CONTENT =================
        SafeArea(
          child: Column(
            children: [
              // ================= TOP SPACE =================
              const SizedBox(height: 38),

              // ================= TITLE + SUBTITLE =================
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),

                child: Column(
                  children: [
                    // ================= TITLE =================
                    data.titleWithLogo
                        // ===== TITLE WITH LOGO =====
                        ? _buildLogoTitle()
                        // ===== NORMAL TITLE =====
                        : Text(
                            data.titleLines.first,

                            textAlign: TextAlign.center,

                            style: GoogleFonts.poppins(
                              color: _dark,

                              fontSize: 18,

                              fontWeight: FontWeight.w700,

                              height: 1.1,
                            ),
                          ),

                    // ================= SPACE =================
                    const SizedBox(height: 14),

                    // ================= SUBTITLE =================
                    Text(
                      data.subtitle,

                      textAlign: TextAlign.center,

                      style: GoogleFonts.poppins(
                        color: const Color(0xFF141414),

                        fontSize: 16,

                        fontWeight: FontWeight.w500,

                        height: 1.35,
                      ),
                    ),
                  ],
                ),
              ),

              // ================= SPACER =================
              const Spacer(flex: 1),

              // ================= CHARACTER =================
              Padding(
                padding: const EdgeInsets.only(bottom: 100),

                child: Center(
                  child: Image.asset(
                    data.character,

                    height: 255,

                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // ================= TITLE WITH LOGO =================
  Widget _buildLogoTitle() {
    final TextStyle style = GoogleFonts.poppins(
      color: _dark,

      fontSize: 18,

      fontWeight: FontWeight.w700,

      height: 1.1,
    );

    return Column(
      children: [
        // ================= LINE 1 =================
        Text('Selamat datang', textAlign: TextAlign.center, style: style),

        // ================= LINE 2 =================
        Row(
          mainAxisAlignment: MainAxisAlignment.center,

          crossAxisAlignment: CrossAxisAlignment.center,

          children: [
            Text('di F', style: style),

            // ================= LOGO =================
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 1),

              child: SvgPicture.asset(
                AssetPaths.logoBlue,

                width: 22,
                height: 22,

                fit: BoxFit.contain,
              ),
            ),

            Text('kusin', style: style),
          ],
        ),
      ],
    );
  }
}

// ================= DATA MODEL =================
class _OBData {
  final List<String> titleLines;

  final bool titleWithLogo;

  final String subtitle;

  final String character;

  final String waveImage;

  const _OBData({
    required this.titleLines,
    required this.titleWithLogo,
    required this.subtitle,
    required this.character,
    required this.waveImage,
  });
}

// ================= INDICATOR =================
class _SpinnerIndicator extends StatelessWidget {
  final int page;

  final int total;

  final Color blue;

  final Color yellow;

  const _SpinnerIndicator({
    required this.page,
    required this.total,
    required this.blue,
    required this.yellow,
  });

  @override
  Widget build(BuildContext context) {
    final double progress = (page + 1) / total;

    return SizedBox(
      width: 64,
      height: 64,

      child: Stack(
        alignment: Alignment.center,

        children: [
          // ================= ARC =================
          CustomPaint(
            size: const Size(64, 64),

            painter: _ArcPainter(
              progress: progress,

              trackColor: yellow.withOpacity(0.25),

              arcColor: yellow,

              strokeWidth: 4.5,
            ),
          ),

          // ================= BLUE CIRCLE =================
          Container(
            width: 48,
            height: 48,

            decoration: BoxDecoration(color: blue, shape: BoxShape.circle),
          ),
        ],
      ),
    );
  }
}

// ================= ARC PAINTER =================
class _ArcPainter extends CustomPainter {
  final double progress;

  final Color trackColor;

  final Color arcColor;

  final double strokeWidth;

  const _ArcPainter({
    required this.progress,
    required this.trackColor,
    required this.arcColor,
    required this.strokeWidth,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Offset center = Offset(size.width / 2, size.height / 2);

    final double radius = size.width / 2 - strokeWidth / 2;

    final Rect rect = Rect.fromCircle(center: center, radius: radius);

    // ================= TRACK =================
    canvas.drawCircle(
      center,
      radius,

      Paint()
        ..color = trackColor
        ..style = PaintingStyle.stroke
        ..strokeWidth = strokeWidth,
    );

    // ================= ARC =================
    canvas.drawArc(
      rect,

      -math.pi / 2,

      2 * math.pi * progress,

      false,

      Paint()
        ..color = arcColor
        ..style = PaintingStyle.stroke
        ..strokeWidth = strokeWidth
        ..strokeCap = StrokeCap.round,
    );
  }

  @override
  bool shouldRepaint(covariant _ArcPainter old) {
    return old.progress != progress;
  }
}

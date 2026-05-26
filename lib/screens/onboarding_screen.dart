import 'dart:async';
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

// lib/screens/onboarding_screen.dart
// 4 halaman: welcome + 3 onboarding
// Auto slide 3 detik, swipe manual, indicator lingkaran biru-kuning

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});
  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  // ── Warna ─────────────────────────────────────────────────────────────────
  static const Color _cream = Color(0xFFFFF8E4);
  static const Color _blue = Color(0xFF229EFF);
  static const Color _dark = Color(0xFF1A1A2E);
  static const Color _grey = Color(0xFF7A7A9D);
  static const Color _yellow = Color(0xFFFFD600);
  static const Color _waveBlue = Color(0xFF5DBAFF);

  // ── Data halaman ───────────────────────────────────────────────────────────
  static const List<_OBData> _pages = <_OBData>[
    _OBData(
      titleLines: <String>['Selamat datang'],
      titleWithLogo: true, // huruf O = logo
      subtitle: 'Fokus lebih baik, capai tujuanmu.\nAyo Mulai!',
      character: 'assets/images/gambar1.png',
      waveType: _WaveType.circle,
    ),
    _OBData(
      titleLines: <String>['Susah fokus saat belajar?'],
      titleWithLogo: false,
      subtitle: 'Banyak distraksi jadi bikin\ntugas jadi tertunda.',
      character: 'assets/images/gambar2.png',
      waveType: _WaveType.diagonal,
    ),
    _OBData(
      titleLines: <String>['Fokus sedikit, tapi konsisten'],
      titleWithLogo: false,
      subtitle: 'Gunakan metode Pomodoro untuk\nbantu kamu tetap on track',
      character: 'assets/images/gambar3.png',
      waveType: _WaveType.sCurve,
    ),
    _OBData(
      titleLines: <String>['Capai targetmu setiap hari'],
      titleWithLogo: false,
      subtitle: 'Bangun kebiasaan fokus\ndan selesaikan tugasmu.',
      character: 'assets/images/gambar4.png',
      waveType: _WaveType.arch,
    ),
  ];

  // ── State ──────────────────────────────────────────────────────────────────
  int _page = 0;
  final PageController _ctrl = PageController();
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: _cream,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
    );
    _startTimer();
  }

  void _startTimer() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 3), (_) {
      if (!mounted) return;
      if (_page < _pages.length - 1) {
        _goTo(_page + 1);
      } else {
        _timer?.cancel();
        context.go('/home');
      }
    });
  }

  void _goTo(int index) {
    setState(() => _page = index);
    _ctrl.animateToPage(
      index,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOutCubic,
    );
  }

  void _onPageChanged(int index) {
    setState(() => _page = index);
    _startTimer(); // reset timer saat swipe manual
  }

  @override
  void dispose() {
    _timer?.cancel();
    _ctrl.dispose();
    super.dispose();
  }

  // ── Build ──────────────────────────────────────────────────────────────────
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _cream,
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            // ── PageView ────────────────────────────────────────────────────
            PageView.builder(
              controller: _ctrl,
              onPageChanged: _onPageChanged,
              physics: const ClampingScrollPhysics(),
              itemCount: _pages.length,
              itemBuilder: (BuildContext context, int index) {
                return _buildPage(context, _pages[index]);
              },
            ),

            // ── Indicator bawah ─────────────────────────────────────────────
            Positioned(
              bottom: 24,
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

  // ── Satu halaman ──────────────────────────────────────────────────────────
  Widget _buildPage(BuildContext context, _OBData data) {
    final Size size = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        // ── Teks di atas ────────────────────────────────────────────────────
        Padding(
          padding: const EdgeInsets.fromLTRB(28, 32, 28, 8),
          child: Column(
            children: <Widget>[
              // Title
              data.titleWithLogo
                  ? _buildLogoTitle(context)
                  : Text(
                      data.titleLines.first,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        color: _dark,
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                        height: 1.35,
                      ),
                    ),
              const SizedBox(height: 12),
              // Subtitle
              Text(
                data.subtitle,
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  color: _grey,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  height: 1.6,
                ),
              ),
            ],
          ),
        ),

        // ── Wave + karakter ─────────────────────────────────────────────────
        Expanded(
          child: Stack(
            clipBehavior: Clip.none,
            children: <Widget>[
              // Wave background
              Positioned.fill(
                child: CustomPaint(
                  painter: _WavePainter(type: data.waveType, color: _waveBlue),
                ),
              ),

              // Karakter di atas wave
              Positioned(
                bottom: 56, // beri ruang untuk indicator
                left: 0,
                right: 0,
                child: Center(
                  child: Image.asset(
                    data.character,
                    height: size.height * 0.38,
                    fit: BoxFit.contain,
                    filterQuality: FilterQuality.high,
                    errorBuilder: (_, __, ___) => SizedBox(
                      height: size.height * 0.38,
                      child: Icon(
                        Icons.image_outlined,
                        size: 80,
                        color: _blue.withValues(alpha: 0.4),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),

        // Ruang untuk indicator
        const SizedBox(height: 88),
      ],
    );
  }

  // ── Title welcome dengan logo menggantikan huruf O ─────────────────────────
  Widget _buildLogoTitle(BuildContext context) {
    final TextStyle style = GoogleFonts.poppins(
      color: _dark,
      fontSize: 22,
      fontWeight: FontWeight.w700,
      height: 1.35,
    );
    return Column(
      children: <Widget>[
        Text('Selamat datang', textAlign: TextAlign.center, style: style),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text('di F', style: style),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 1),
              child: SvgPicture.asset(
                'assets/icons/logo_blue.svg',
                width: 24,
                height: 24,
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

// ─── Data model ─────────────────────────────────────────────────────────────
enum _WaveType { circle, diagonal, sCurve, arch }

class _OBData {
  final List<String> titleLines;
  final bool titleWithLogo;
  final String subtitle;
  final String character;
  final _WaveType waveType;
  const _OBData({
    required this.titleLines,
    required this.titleWithLogo,
    required this.subtitle,
    required this.character,
    required this.waveType,
  });
}

// ─── Wave CustomPainter (BUKAN untuk wave PNG — ini untuk shape background) ──
class _WavePainter extends CustomPainter {
  final _WaveType type;
  final Color color;
  const _WavePainter({required this.type, required this.color});

  @override
  void paint(Canvas canvas, Size s) {
    final Paint p = Paint()
      ..color = color.withValues(alpha: 0.85)
      ..style = PaintingStyle.fill;

    switch (type) {
      case _WaveType.circle:
        // Lingkaran besar di kanan-bawah (welcome)
        canvas.drawCircle(
          Offset(s.width * 0.55, s.height * 0.52),
          s.width * 0.72,
          p,
        );
        break;

      case _WaveType.diagonal:
        // Diagonal dari kiri-atas ke kanan-bawah (OB1)
        final Path path = Path()
          ..moveTo(0, s.height * 0.30)
          ..cubicTo(
            s.width * 0.2,
            s.height * 0.10,
            s.width * 0.6,
            s.height * 0.25,
            s.width,
            s.height * 0.15,
          )
          ..lineTo(s.width, s.height)
          ..lineTo(0, s.height)
          ..close();
        canvas.drawPath(path, p);
        break;

      case _WaveType.sCurve:
        // S-curve (OB2)
        final Path path = Path()
          ..moveTo(0, s.height * 0.22)
          ..cubicTo(
            s.width * 0.35,
            s.height * -0.05,
            s.width * 0.65,
            s.height * 0.48,
            s.width,
            s.height * 0.20,
          )
          ..lineTo(s.width, s.height)
          ..lineTo(0, s.height)
          ..close();
        canvas.drawPath(path, p);
        break;

      case _WaveType.arch:
        // Arch/hill (OB3)
        final Path path = Path()
          ..moveTo(0, s.height * 0.38)
          ..cubicTo(
            s.width * 0.25,
            s.height * 0.0,
            s.width * 0.75,
            s.height * 0.0,
            s.width,
            s.height * 0.38,
          )
          ..lineTo(s.width, s.height)
          ..lineTo(0, s.height)
          ..close();
        canvas.drawPath(path, p);
        break;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter _) => false;
}

// ─── Indicator lingkaran biru + arc kuning ──────────────────────────────────
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
        children: <Widget>[
          // Arc kuning (progress)
          CustomPaint(
            size: const Size(64, 64),
            painter: _ArcPainter(
              progress: progress,
              trackColor: yellow.withValues(alpha: 0.25),
              arcColor: yellow,
              strokeWidth: 4.5,
            ),
          ),
          // Lingkaran biru
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

// ─── Arc painter untuk indicator ────────────────────────────────────────────
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

    // Track
    canvas.drawCircle(
      center,
      radius,
      Paint()
        ..color = trackColor
        ..style = PaintingStyle.stroke
        ..strokeWidth = strokeWidth,
    );

    // Arc
    if (progress > 0) {
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
  }

  @override
  bool shouldRepaint(covariant _ArcPainter old) => old.progress != progress;
}

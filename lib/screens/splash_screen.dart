import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fokusin_app1/core/constants/app_colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _shadowCtrl;
  late AnimationController _iconCtrl;
  late AnimationController _logoCtrl;
  late AnimationController _tagCtrl;

  late Animation<double> _shadowScaleX, _shadowOpacity;
  late Animation<double> _iconScale, _iconOpacity;
  late Animation<double> _logoScale, _logoOpacity;
  late Animation<Offset> _logoSlide;
  late Animation<double> _tagOpacity;
  late Animation<Offset> _tagSlide;

  @override
  void initState() {
    super.initState();
    _lockUI();
    _initAnims();
    _play();
  }

  void _lockUI() {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarColor: AppColors.primary,
        systemNavigationBarIconBrightness: Brightness.light,
      ),
    );
  }

  void _initAnims() {
    _shadowCtrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    _shadowScaleX = Tween(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _shadowCtrl, curve: Curves.easeOutBack));
    _shadowOpacity = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _shadowCtrl,
        curve: const Interval(0.0, 0.6, curve: Curves.easeIn),
      ),
    );

    _iconCtrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    _iconScale = Tween(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _iconCtrl, curve: Curves.elasticOut));
    _iconOpacity = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _iconCtrl,
        curve: const Interval(0.0, 0.4, curve: Curves.easeIn),
      ),
    );

    _logoCtrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );
    _logoScale = Tween(
      begin: 0.7,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _logoCtrl, curve: Curves.easeOutBack));
    _logoOpacity = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _logoCtrl,
        curve: const Interval(0.0, 0.5, curve: Curves.easeIn),
      ),
    );
    _logoSlide = Tween(
      begin: const Offset(0, 0.12),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _logoCtrl, curve: Curves.easeOutCubic));

    _tagCtrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
    _tagOpacity = Tween(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _tagCtrl, curve: Curves.easeIn));
    _tagSlide = Tween(
      begin: const Offset(0, 0.4),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _tagCtrl, curve: Curves.easeOutCubic));
  }

  Future<void> _play() async {
    await Future.delayed(const Duration(milliseconds: 50));

    // Phase 1 – shadow
    await _shadowCtrl.forward();
    await Future.delayed(const Duration(milliseconds: 80));

    // Phase 2 – shadow hilang, ikon muncul
    await _shadowCtrl.reverse();
    await _iconCtrl.forward();
    await Future.delayed(const Duration(milliseconds: 150));

    // Phase 3 – ikon hilang, logo F+ikon+KUSIN muncul
    await _iconCtrl.reverse();
    await _logoCtrl.forward();
    await Future.delayed(const Duration(milliseconds: 100));

    // Phase 4 – tagline
    await _tagCtrl.forward();
    await Future.delayed(const Duration(milliseconds: 1800));

    if (mounted) context.go('/home');
  }

  @override
  void dispose() {
    _shadowCtrl.dispose();
    _iconCtrl.dispose();
    _logoCtrl.dispose();
    _tagCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Stack(
        children: [
          // Shadow oval (phase 1) — di belakang
          Center(child: _buildShadow()),

          // Konten utama — di tengah
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Phase 2 & 3 di-stack agar overlap di posisi sama
                SizedBox(
                  height: 100, // ruang tetap, ikon & logo bergantian di sini
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      // Phase 2: ikon saja
                      _buildIconOnly(),
                      // Phase 3: F + ikon + KUSIN
                      _buildFullLogo(),
                    ],
                  ),
                ),

                const SizedBox(height: 16),

                // Phase 4: tagline
                _buildTagline(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ── Phase 1: Shadow oval ───────────────────────────────────────────────────
  Widget _buildShadow() {
    return AnimatedBuilder(
      animation: _shadowCtrl,
      builder: (_, __) => Opacity(
        opacity: _shadowOpacity.value,
        child: Transform.scale(
          scaleX: _shadowScaleX.value,
          child: Container(
            width: 130,
            height: 22,
            decoration: BoxDecoration(
              color: AppColors.blue700.withOpacity(0.5),
              borderRadius: BorderRadius.circular(65),
              boxShadow: [
                BoxShadow(
                  color: AppColors.blue700.withOpacity(0.35),
                  blurRadius: 24,
                  spreadRadius: 6,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // ── Phase 2: ikon logo_blue.svg warna asli ────────────────────────────────
  Widget _buildIconOnly() {
    return AnimatedBuilder(
      animation: _iconCtrl,
      builder: (_, __) => Opacity(
        opacity: _iconOpacity.value,
        child: Transform.scale(
          scale: _iconScale.value,
          child: SvgPicture.asset(
            'assets/icons/logo_blue.svg',
            width: 244,
            height: 81,
          ),
        ),
      ),
    );
  }

  // ── Phase 3: "F" + logo_blue.svg + "KUSIN" ────────────────────────────────
  Widget _buildFullLogo() {
    return AnimatedBuilder(
      animation: _logoCtrl,
      builder: (_, __) {
        final logoStyle = GoogleFonts.lalezar(
          color: Colors.white,
          fontSize: 48,
          fontWeight: FontWeight.w400,
          height: 1.0,
        );

        return Opacity(
          opacity: _logoOpacity.value,
          child: SlideTransition(
            position: _logoSlide,
            child: Transform.scale(
              scale: _logoScale.value,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('F', style: logoStyle),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 2),
                    child: SvgPicture.asset(
                      'assets/icons/logo_blue.svg',
                      width: 46,
                      height: 46,
                      fit: BoxFit.contain,
                    ),
                  ),
                  Text('KUSIN', style: logoStyle),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  // ── Phase 4: Tagline ───────────────────────────────────────────────────────
  Widget _buildTagline() {
    return AnimatedBuilder(
      animation: _tagCtrl,
      builder: (_, __) => Opacity(
        opacity: _tagOpacity.value,
        child: SlideTransition(
          position: _tagSlide,
          child: Text(
            'Stay Focused. Stay Productive.',
            style: GoogleFonts.lalezar(
              color: Colors.white.withOpacity(0.72),
              fontSize: 14,
              fontWeight: FontWeight.w400,
              letterSpacing: 0.5,
            ),
          ),
        ),
      ),
    );
  }
}

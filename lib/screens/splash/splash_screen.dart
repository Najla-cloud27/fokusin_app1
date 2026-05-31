import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  static const Color _bg = Color(0xFF229EFF);

  late AnimationController _controller;

  // ELLIPSE
  late Animation<double> _ellipseWidth;
  late Animation<double> _ellipseHeight;
  late Animation<double> _ellipseOpacity;

  // LOGO
  late Animation<double> _logoOpacity;
  late Animation<double> _logoScale;
  late Animation<Offset> _logoSlide;

  // TEXT
  late Animation<Offset> _fSlide;
  late Animation<Offset> _kusinSlide;
  late Animation<double> _textOpacity;

  @override
  void initState() {
    super.initState();

    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarColor: _bg,
        systemNavigationBarIconBrightness: Brightness.light,
      ),
    );

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 5500),
    );

    // DOT -> ELLIPSE
    _ellipseWidth = Tween<double>(begin: 10, end: 180).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.18, curve: Curves.easeOutCubic),
      ),
    );

    _ellipseHeight = Tween<double>(begin: 10, end: 24).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.18, curve: Curves.easeOutCubic),
      ),
    );

    _ellipseOpacity = Tween<double>(begin: 1, end: 0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.15, 0.28, curve: Curves.easeOut),
      ),
    );

    // LOGO
    _logoOpacity = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.22, 0.35, curve: Curves.easeIn),
      ),
    );

    // Logo besar di tengah lalu mengecil natural
    _logoScale = Tween<double>(begin: 1.8, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.22, 0.72, curve: Curves.easeOutExpo),
      ),
    );

    // Logo awalnya center, lalu geser jadi huruf O
    _logoSlide = Tween<Offset>(begin: const Offset(0.85, 0), end: Offset.zero)
        .animate(
          CurvedAnimation(
            parent: _controller,
            curve: const Interval(0.55, 0.82, curve: Curves.easeOutCubic),
          ),
        );

    // TEXT
    _fSlide = Tween<Offset>(begin: const Offset(0, 3.5), end: Offset.zero)
        .animate(
          CurvedAnimation(
            parent: _controller,
            curve: const Interval(0.72, 0.92, curve: Curves.easeOutBack),
          ),
        );

    _kusinSlide = Tween<Offset>(begin: const Offset(0, 3.5), end: Offset.zero)
        .animate(
          CurvedAnimation(
            parent: _controller,
            curve: const Interval(0.76, 0.94, curve: Curves.easeOutBack),
          ),
        );

    _textOpacity = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.72, 0.90, curve: Curves.easeIn),
      ),
    );

    // START
    _controller.forward();

    // NAVIGATE
    Future.delayed(const Duration(milliseconds: 8200), () {
      if (mounted) {
        context.go('/splash-cream');
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final TextStyle logoStyle = GoogleFonts.lalezar(
      color: const Color(0xFFF6F6F6),
      fontSize: 44,
      fontWeight: FontWeight.w400,
      height: 1,
    );

    return Scaffold(
      backgroundColor: _bg,

      body: Center(
        child: AnimatedBuilder(
          animation: _controller,

          builder: (context, child) {
            return Stack(
              alignment: Alignment.center,

              children: [
                // ELLIPSE
                Opacity(
                  opacity: _ellipseOpacity.value,

                  child: Container(
                    width: _ellipseWidth.value,
                    height: _ellipseHeight.value,

                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.12),
                      borderRadius: BorderRadius.circular(999),
                    ),
                  ),
                ),

                
                // LOGO + TEXT
                Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,

                  children: [
                    // F
                    SlideTransition(
                      position: _fSlide,

                      child: FadeTransition(
                        opacity: _textOpacity,

                        child: Text('F', style: logoStyle),
                      ),
                    ),

                    const SizedBox(width: 4),

                    // LOGO
                    SlideTransition(
                      position: _logoSlide,

                      child: Transform.scale(
                        scale: _logoScale.value,

                        child: FadeTransition(
                          opacity: _logoOpacity,

                          child: SvgPicture.asset(
                            'assets/icons/logo_white.svg',
                            width: 54,
                            height: 54,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(width: 4),

                    // KUSIN
                    SlideTransition(
                      position: _kusinSlide,

                      child: FadeTransition(
                        opacity: _textOpacity,

                        child: Text('KUSIN', style: logoStyle),
                      ),
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

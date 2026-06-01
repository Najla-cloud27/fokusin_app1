import 'package:flutter/material.dart';

class OnboardingWave extends StatelessWidget {
  final String image;

  const OnboardingWave({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Image.asset(image, fit: BoxFit.cover),
    );
  }
}

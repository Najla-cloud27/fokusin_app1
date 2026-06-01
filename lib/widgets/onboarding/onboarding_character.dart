import 'package:flutter/material.dart';

class OnboardingCharacter extends StatelessWidget {
  final String image;

  const OnboardingCharacter({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Image.asset(image, width: 260, fit: BoxFit.contain);
  }
}

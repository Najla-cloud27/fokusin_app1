import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class GoogleButton extends StatelessWidget {
  final VoidCallback onPressed;

  const GoogleButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 55,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          side: BorderSide(
            color: const Color(0xFF2574B2).withOpacity(0.3),
            width: 1.5,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          backgroundColor: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/icons/icon_google.svg', // Memanggil aset milikmu
              width: 24,
              height: 24,
            ),
            const SizedBox(width: 12),
            const Text(
              'Masuk dengan Google',
              style: TextStyle(
                color: Colors.black87,
                fontSize: 15,
                fontWeight: FontWeight.w500,
                fontFamily: 'Poppins',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

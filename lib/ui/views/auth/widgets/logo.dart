import 'package:dionniebee/ui/common/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.black.withOpacity(0.8),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          runSpacing: 10,
          spacing: 10,
          runAlignment: WrapAlignment.center,
          children: [
            Image.asset('assets/logo.png', width: 45, color: kcPrimaryColor),
            Text(
              "DIONNIEBEE",
              style: const TextStyle(fontSize: 26).copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontFamily: GoogleFonts.varelaRound().fontFamily,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

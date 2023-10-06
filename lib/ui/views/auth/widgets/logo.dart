import 'package:dionniebee/ui/common/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          'assets/bee.png',
          width: 100,
          color: Colors.red,
        ),
        hSpaceRegular,
        Text(
          "COFFEECO",
          style: const TextStyle(fontSize: 26).copyWith(
            fontWeight: FontWeight.bold,
            fontFamily: GoogleFonts.varelaRound().fontFamily,
          ),
        ),
      ],
    );
  }
}

import 'package:dionniebee/ui/common/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    fontFamily: GoogleFonts.varelaRound().fontFamily,
    useMaterial3: false,
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(8),
      ),
      filled: true,
    ),
    appBarTheme: AppBarTheme(
        backgroundColor: kcPrimaryColor,
        foregroundColor: Colors.white,
        titleTextStyle: TextStyle(
            color: Colors.white,
            fontFamily: GoogleFonts.varelaRound().fontFamily,
            fontWeight: FontWeight.bold,
            fontSize: 18)),
    brightness: Brightness.light,
    colorSchemeSeed: kcPrimaryColor,
  );

  static ThemeData darkTheme = ThemeData(
    fontFamily: GoogleFonts.varelaRound().fontFamily,
    useMaterial3: false,
    appBarTheme: AppBarTheme(
        backgroundColor: kcPrimaryColor,
        foregroundColor: Colors.white,
        titleTextStyle: TextStyle(
            color: Colors.white,
            fontFamily: GoogleFonts.varelaRound().fontFamily,
            fontWeight: FontWeight.bold,
            fontSize: 18)),
    brightness: Brightness.dark,
    colorSchemeSeed: kcPrimaryColor,
  );
}

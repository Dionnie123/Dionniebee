import 'package:dionniebee/global/colors.dart';
import 'package:flutter/material.dart';
import 'typography.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    fontFamily: appFont,
    useMaterial3: false,
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(8),
      ),
      filled: true,
    ),
    appBarTheme: AppBarTheme(
        backgroundColor: kcPrimary,
        foregroundColor: Colors.white,
        titleTextStyle: TextStyle(
            color: Colors.white,
            fontFamily: appFont,
            fontWeight: FontWeight.bold,
            fontSize: 18)),
    brightness: Brightness.light,
    colorSchemeSeed: kcPrimary,
  );

  static ThemeData darkTheme = ThemeData(
    fontFamily: appFont,
    useMaterial3: false,
    appBarTheme: AppBarTheme(
        backgroundColor: kcPrimary,
        foregroundColor: Colors.white,
        titleTextStyle: TextStyle(
            color: Colors.white,
            fontFamily: appFont,
            fontWeight: FontWeight.bold,
            fontSize: 18)),
    brightness: Brightness.dark,
    colorSchemeSeed: kcPrimary,
  );
}

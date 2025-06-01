import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static final lightTheme = ThemeData(
    primaryColor: Color(0xff377DFF),
    appBarTheme: AppBarTheme(
        backgroundColor: Colors.white,
        foregroundColor: Color(0xff377DFF),
        elevation: 0,
        surfaceTintColor: Colors.transparent),
    scaffoldBackgroundColor: Colors.white,
    hintColor: Color(0xffAAB0B7),
    canvasColor: Color(0xff58616A),
    colorScheme: ColorScheme.fromSeed(seedColor: Color(0xff377DFF)),
    useMaterial3: true,
    textTheme: GoogleFonts.interTextTheme()
        .apply(
          bodyColor: Color(0xff243443),
          displayColor: Color(0xff243443),
        )
        .copyWith(
          bodyMedium: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Color(0xff243443),
          ),
          bodySmall: TextStyle(fontSize: 14, color: Color(0xff243443)),
          bodyLarge: TextStyle(fontSize: 18, color: Color(0xff243443)),
        ),
    filledButtonTheme: FilledButtonThemeData(
      style: ButtonStyle(
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
    ),
  );
}

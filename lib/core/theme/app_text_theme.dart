import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextTheme {
  static TextStyle bodySmall = GoogleFonts.inter(
    fontSize: 14,
    color: const Color(0xff243443),
  );
  static TextStyle bodyMedium = GoogleFonts.inter(
    fontSize: 16,
    color: const Color(0xff243443),
  );
  static TextStyle bodyLarge = GoogleFonts.inter(
    fontSize: 18,
    color: const Color(0xff243443),
  );

  static TextStyle h1 = GoogleFonts.inter(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    color: const Color(0xff243443),
    letterSpacing: 0.5,
    height: 1.2,
  );

  static TextStyle h2 = GoogleFonts.inter(
    fontSize: 28,
    fontWeight: FontWeight.w600,
    color: const Color(0xff243443),
    letterSpacing: 0.25,
    height: 1.22,
  );

  static TextStyle h3 = GoogleFonts.inter(
    fontSize: 24,
    fontWeight: FontWeight.w500,
    color: const Color(0xff243443),
    letterSpacing: 0.15,
    height: 1.24,
  );

  static TextStyle h4 = GoogleFonts.inter(
    fontSize: 20,
    fontWeight: FontWeight.w500,
    color: const Color(0xff243443),
    letterSpacing: 0.1,
    height: 1.26,
  );

  static TextStyle h5 = GoogleFonts.inter(
    fontSize: 18,
    fontWeight: FontWeight.w400,
    color: const Color(0xff243443),
    letterSpacing: 0.05,
    height: 1.28,
  );

  static TextStyle h6 = GoogleFonts.inter(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: const Color(0xff243443),
    letterSpacing: 0.0,
    height: 1.3,
  );
}

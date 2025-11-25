import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/app_colors.dart';
import 'neon_theme.dart';


class AppTheme {
  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.bgLight,
    textTheme: GoogleFonts.plusJakartaSansTextTheme()
        .apply(bodyColor: Colors.black, displayColor: Colors.black),
    cardColor: Colors.white,
    extensions: [
      NeonTheme(
        gradient: AppColors.buttonGradient,
        glowColor: Colors.blueAccent,
      ),
    ],
  );

  static final darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.bgColor,
    textTheme: GoogleFonts.plusJakartaSansTextTheme()
        .apply(bodyColor: Colors.white.withOpacity(.85), displayColor: Colors.white),
    cardColor: const Color(0xFF0E1622),
    extensions: [
      NeonTheme(
        gradient: AppColors.buttonGradient,
        glowColor: Colors.blueAccent,
      ),
    ],
    useMaterial3: true,
  );
}

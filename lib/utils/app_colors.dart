import 'package:flutter/material.dart';

class AppColors {
  // static const primary = Color(0xFFFF9C1A);  // Orange accent
  static const primary = bgColor;  // Orange accent


  static const primaryDark = Color(0xFFF63D2E); // Orange accent
  // static const bgLight = Color(0xFFF2F5F9); // Light grey page background
  static const bgLight = bgColor; // Light grey page background
  static const cardLight = Color(0xFFFCE1C4); // Light orange cards
  static const cardBlue = Color(0xFFE1EEF7); // Light blue cards
  static const dark = Color(0xFF2E2E2E); // Main dark text
  static const white = Color(0xFFFFFFFF);




  static const primaryColor = Colors.white;
  static const secondaryColor = Color(0xFF242430);
  static const darkColor = Color(0xFF191923);
  static const bodyTextColor = Color(0xFF8B8B8D);
  static const bgColor = Color(0xFF000515);
  static const defaultPadding = 20.0; // Main dark text

  static const buttonGradient = LinearGradient(
    /*colors: [
      Color(0xFFFF9C1A),
      Color(0xFFF63D2E),
    ],*/
    colors: [Colors.pinkAccent, Colors.blue],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static Decoration? get cardDecoration => BoxDecoration(
    gradient: const LinearGradient(
      colors: [Color(0xFF101526), Color(0xFF0B1120)],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
    borderRadius: BorderRadius.circular(22),
    boxShadow: [
      BoxShadow(
        color: AppColors.primary.withOpacity(0.5),
        blurRadius: 25,
        spreadRadius: 2,
      ),
    ],
  );
}

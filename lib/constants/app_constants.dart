import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  static const Color background = Color(0xFFF6F5EE);
  static const Color surface = Colors.white;
  static const Color headerBackground = Colors.white;
  static const Color textPrimary = Color(0xFF1A1A1A);
  static const Color textSecondary = Color(0xFF616161);

  static const Color primaryOrange = Color(0xFFFF5722);
  static const Color primaryOrangeLight = Color(0xFFFF7043);

  static const Color accentGreen = Color(0xFF43A047);
  static const Color accentGreenDark = Color(0xFF1B4332);
  static const Color accentYellow = Color(0xFFFFC107);
  static const Color accentPurple = Color(0xFF7E57C2);
  static const Color accentBlue = Color(0xFF1565C0);
  static const Color accentRed = Color(0xFFC62828);
  static const Color accentTeal = Color(0xFF00897B);
  static const Color accentPink = Color(0xFFEC407A);

  static const Color cardPurple = Color(0xFFEDE7F6);
  static const Color cardOrange = Color(0xFFFFF3E0);
  static const Color cardGreen = Color(0xFFE8F5E9);
  static const Color cardYellow = Color(0xFFFFF9C4);

  static const Color featureDarkBg = Color(0xFF1B4332);
  static const Color darkBg = Color(0xFF111111);
  static const Color footerBg = Color(0xFF1A1A1A);

  static const Color border = Color(0xFFE0E0E0);
  static const Color shadow = Color(0x1A000000);

  static const colorizeColors = [
    Colors.purple,
    Colors.blue,
    Colors.yellow,
    Colors.red,
  ];

  static const colorizeTextStyle = TextStyle(
    fontSize: 40.0,
    fontWeight: FontWeight.bold,
    color: textPrimary,
  );
}

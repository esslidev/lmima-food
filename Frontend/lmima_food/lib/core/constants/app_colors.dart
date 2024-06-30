import 'package:flutter/material.dart';

class AppColors {
  // global colors

  static const Color greenBianchi = Color(0xFF06623B);
  static const Color grayTahitianPearl = Color(0xFF273746);
  static const Color yellowHoney = Color(0xFFFEBD56);
  static const Color blueScooter = Color(0xFF2B889D);
  static const Color whiteSolid = Color(0xFFFFFFFF);
  static LightTheme get light => LightTheme();
  static DarkTheme get dark => DarkTheme();
}

class LightTheme {
  final Color primaryColor1 = AppColors.greenBianchi;
  final Color primaryColor2 = AppColors.grayTahitianPearl;
  final Color primaryColor3 = AppColors.yellowHoney;
  final Color primaryColor4 = AppColors.blueScooter;
  final Color primaryColor5 = AppColors.whiteSolid;
}

class DarkTheme {
  final Color primaryColor1 = AppColors.greenBianchi;
  final Color primaryColor2 = AppColors.grayTahitianPearl;
  final Color primaryColor3 = AppColors.yellowHoney;
  final Color primaryColor4 = AppColors.blueScooter;
  final Color primaryColor5 = AppColors.whiteSolid;
}

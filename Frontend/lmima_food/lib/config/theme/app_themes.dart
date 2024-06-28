import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';

class AppThemes {
  // Add more text styles as needed...
  static ThemeData themeData = ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.black, // Set your primary color
    fontFamily: 'Work-Sans',
    scaffoldBackgroundColor: AppColors.whiteSolid,
  );

  static const TextStyle headline = TextStyle(
    fontWeight: FontWeight.w500,
    color: AppColors.grayArsenic,
  );
  static const TextStyle secondaryHeadline = TextStyle(
    fontWeight: FontWeight.w600,
    color: AppColors.grayArsenic,
  );

  static const TextStyle bodyText =
      TextStyle(color: Colors.black, fontWeight: FontWeight.w400);
}

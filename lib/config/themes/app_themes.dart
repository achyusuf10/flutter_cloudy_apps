import 'package:cloudy/config/themes/app_colors.dart';
import 'package:flutter/material.dart';

class AppThemes {
  AppThemes._();

  static ThemeData lightTheme = ThemeData(
    primaryColor: AppColors.primary500,
    focusColor: Colors.transparent,
    scaffoldBackgroundColor: Colors.white,
    fontFamily: 'poppins',
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        fontSize: 35,
        fontWeight: FontWeight.w600,
        height: 1.219,
      ),
      displayMedium: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.w600,
        height: 1.219,
      ),
      displaySmall: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.w600,
        height: 1.219,
      ),
      headlineMedium: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w600,
        height: 1.219,
      ),
      headlineSmall: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        height: 1.219,
      ),
      titleLarge: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w600,
        height: 1.219,
      ),
      titleMedium: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        height: 1.219,
      ),
      titleSmall: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        height: 1.219,
      ),
      bodyLarge: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w400,
        height: 1.219,
      ),
      bodyMedium: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        height: 1.219,
      ),
      bodySmall: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        height: 1.219,
      ),
      labelLarge: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        height: 1.219,
      ),
      labelMedium: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        height: 1.219,
      ),
      labelSmall: TextStyle(
        fontSize: 10,
        fontWeight: FontWeight.w600,
        height: 1.219,
      ),
    ),
    colorScheme: ColorScheme.fromSwatch().copyWith(
      primary: AppColors.primary500,
      secondary: AppColors.secondary500,
    ),
  );
}

import 'package:cloudy/config/themes/app_colors.dart';
import 'package:flutter/material.dart';

class AppGradient {
  static LinearGradient get primaryGradient => const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          AppColors.primary500,
          AppColors.secondary500,
        ],
      );
  static LinearGradient get primarySecondary => const LinearGradient(
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        colors: [
          AppColors.primary500,
          AppColors.secondary500,
        ],
      );
}

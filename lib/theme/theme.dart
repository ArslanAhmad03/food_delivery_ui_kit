import 'package:flutter/material.dart';
import 'package:food_delivery_ui_kit/theme/app_colors.dart';

class AppTheme {
  static final ColorScheme _lightColors =
      ColorScheme.fromSeed(
        seedColor: AppColors.orangeBase,
        brightness: Brightness.light,
      ).copyWith(
        primary: AppColors.orangeBase,
        onPrimary: AppColors.font2,
        primaryContainer: AppColors.orange2,
        onPrimaryContainer: AppColors.font,

        secondary: AppColors.yellowBase,
        onSecondary: AppColors.font,
        secondaryContainer: AppColors.yellow2,
        onSecondaryContainer: AppColors.font,

        background: const Color(0xFFFCFCFC),
        onBackground: AppColors.font,
        surface: Colors.white,
        onSurface: AppColors.font,

        error: const Color(0xFFB00020),
        onError: Colors.white,
      );

  static final ColorScheme _darkColors =
      ColorScheme.fromSeed(
        seedColor: AppColors.orangeBase,
        brightness: Brightness.dark,
      ).copyWith(
        primary: AppColors.orangeBase,
        onPrimary: AppColors.font2,
        primaryContainer: AppColors.orange2,
        onPrimaryContainer: AppColors.font,

        secondary: AppColors.yellowBase,
        onSecondary: AppColors.font,

        background: const Color(0xFF121212),
        onBackground: AppColors.font2,
        surface: const Color(0xFF1E1E1E),
        onSurface: AppColors.font2,

        error: const Color(0xFFCF6679),
        onError: Colors.black,
      );

  static final ThemeData lightTheme = ThemeData(
    fontFamily: 'League Spartan',
    useMaterial3: true,
    colorScheme: _lightColors,
    // scaffoldBackgroundColor: _lightColors.background,
    scaffoldBackgroundColor: AppColors.yellowBase,
    appBarTheme: AppBarTheme(
      backgroundColor: _lightColors.primary,
      foregroundColor: _lightColors.onPrimary,
      elevation: 0,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: _lightColors.primary,
        foregroundColor: _lightColors.onPrimary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      ),
    ),
    textTheme: const TextTheme().apply(
      bodyColor: AppColors.font,
      displayColor: AppColors.font,
    ),
    cardTheme: CardThemeData(
      color: _lightColors.surface,
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    fontFamily: 'League Spartan',
    useMaterial3: true,
    colorScheme: _darkColors,
    // scaffoldBackgroundColor: _darkColors.background,
    scaffoldBackgroundColor: AppColors.yellowBase,
    appBarTheme: AppBarTheme(
      backgroundColor: _darkColors.primary,
      foregroundColor: _darkColors.onPrimary,
      elevation: 0,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: _darkColors.primary,
        foregroundColor: _darkColors.onPrimary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      ),
    ),
    textTheme: const TextTheme().apply(
      bodyColor: AppColors.font2,
      displayColor: AppColors.font2,
    ),
    cardTheme: CardThemeData(
      color: _darkColors.surface,
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    ),
  );
}

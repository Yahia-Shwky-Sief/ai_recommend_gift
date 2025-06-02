
import 'package:ai_recommend_gift/core/theme/app_palette.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static final lightThemeMode = ThemeData.light().copyWith(
    colorScheme: const ColorScheme.light(
      primary: AppPalette.primary,
      secondary: AppPalette.accent,
      error: AppPalette.errorColor,
    ),
    appBarTheme: const AppBarTheme(
      elevation: 0,
      scrolledUnderElevation: 0,
    ),
  );
  static final darkThemeMode = ThemeData.dark().copyWith(
    colorScheme: const ColorScheme.dark(
      primary: AppPalette.darkPrimary,
      secondary: AppPalette.accent,
      error: AppPalette.errorColor,   
    ),
    appBarTheme: const AppBarTheme(
      elevation: 0,
      scrolledUnderElevation: 0,
    ),
    
  );
}

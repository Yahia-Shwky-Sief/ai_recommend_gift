
import 'package:ai_recommend_gift/core/theme/app_palette.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static final lightThemeMode = ThemeData.light().copyWith(
    scaffoldBackgroundColor: Colors.white,
    brightness: Brightness.light,
    primaryColor: AppPalette.primary,
    primaryColorLight: AppPalette.lightPrimary,
    primaryColorDark: AppPalette.darkPrimary,
    
  );

  static final darkThemeMode = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: AppPalette.darkBackground,
    brightness: Brightness.dark,
    primaryColor: AppPalette.primary,
    primaryColorLight: AppPalette.lightPrimary,
    primaryColorDark: AppPalette.darkPrimary,
  );
}

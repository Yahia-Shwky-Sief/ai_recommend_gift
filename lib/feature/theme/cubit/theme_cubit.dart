import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import '../../../core/services/theme_service.dart';

class ThemeCubit extends Cubit<ThemeMode> {
  final ThemeService _themeService;

  ThemeCubit(this._themeService) : super(ThemeMode.light) {
    _loadTheme();
  }

  void _loadTheme() async {
    final isDark = await _themeService.loadTheme();
    emit(isDark ? ThemeMode.dark : ThemeMode.light);
  }

  void toggleTheme() async {
    final newTheme = state == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    await _themeService.saveTheme(newTheme == ThemeMode.dark);
    emit(newTheme);
  }
}

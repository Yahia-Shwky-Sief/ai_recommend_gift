import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import '../../../core/services/theme_service.dart';

class ThemeCubit extends Cubit<ThemeMode> {
  final ThemeService _themeService;

  ThemeCubit(this._themeService, ThemeMode initialTheme) : super(initialTheme);

  void toggleTheme() async {
    final newTheme = state == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    await _themeService.saveTheme(newTheme == ThemeMode.dark);
    emit(newTheme);
  }
}

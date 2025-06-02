// core/services/theme_service.dart

import 'package:shared_preferences/shared_preferences.dart';

class ThemeService {
  static const _key = 'is_dark_mode';

  Future<void> saveTheme(bool isDark) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_key, isDark);
  }

  Future<bool> loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_key) ?? false; // default to light
  }
}

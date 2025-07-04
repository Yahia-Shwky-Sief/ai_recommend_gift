import 'package:ai_recommend_gift/core/services/theme_service.dart';
import 'package:ai_recommend_gift/core/theme/theme.dart';
import 'package:ai_recommend_gift/feature/home/home.dart';
import 'package:ai_recommend_gift/feature/theme/cubit/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final themeService = ThemeService();
  final isDark = await themeService.loadTheme();
  runApp(
    MyApp(
      initialTheme: isDark ? ThemeMode.dark : ThemeMode.light,
      themeService: themeService,
    ),
  );
}

class MyApp extends StatelessWidget {
  final ThemeMode initialTheme;
  final ThemeService themeService;
  const MyApp({
    super.key,
    required this.initialTheme,
    required this.themeService,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ThemeCubit(themeService, initialTheme),
      child: BlocBuilder<ThemeCubit, ThemeMode>(
        builder: (context, themeMode) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: AppTheme.lightThemeMode,
            darkTheme: AppTheme.darkThemeMode,
            themeMode: themeMode,
            home: Home(),
          );
        },
      ),
    );
  }
}

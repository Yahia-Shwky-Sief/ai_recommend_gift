import 'package:ai_recommend_gift/core/theme/theme.dart';
import 'package:ai_recommend_gift/feature/home/home.dart';
import 'package:flutter/material.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkThemeMode,
      home: const Home(),
    );
  }
}

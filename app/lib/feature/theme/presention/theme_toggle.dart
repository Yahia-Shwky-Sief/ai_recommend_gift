import 'package:ai_recommend_gift/feature/theme/cubit/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class ThemeToggle extends StatelessWidget {
  const ThemeToggle({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: BlocBuilder<ThemeCubit, ThemeMode>(
        builder: (context, theme) {
          return Icon(theme == ThemeMode.dark ? Icons.light_mode : Icons.dark_mode);
        },
      ),
      onPressed: () => context.read<ThemeCubit>().toggleTheme(),
    );
  }
}

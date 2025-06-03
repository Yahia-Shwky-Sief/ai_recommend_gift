import 'package:ai_recommend_gift/feature/gift_form/logic/radio_cubit/radio_cubit.dart';
import 'package:ai_recommend_gift/feature/gift_form/presention/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomRadioPage extends StatelessWidget {
  final List<List> options;
  final Function(String) onOptionSelected;

  const CustomRadioPage({
    super.key,
    required this.options,
    required this.onOptionSelected,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => OptionCubit(),
      child: BlocBuilder<OptionCubit, int>(
        builder: (context, selectedIndex) {
          final cubit = context.read<OptionCubit>();

          return Center(
            child: GridView.builder(
              padding: EdgeInsets.all(16),
              itemCount: options.length,
              itemBuilder: (context, index) {
                final isSelected = selectedIndex == index;
                return GestureDetector(
                  onTap: () {
                    cubit.selectOption(index);
                    onOptionSelected(options[index][0]);
                  },
                  child: buttonWidget(
                    data: options[index],
                    isSelected: isSelected,
                    context: context,
                  ),
                );
              },
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
              ),
            ),
          );
        },
      ),
    );
  }
}

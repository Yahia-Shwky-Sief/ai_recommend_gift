import 'package:ai_recommend_gift/feature/gift_form/logic/radio_cubit/radio_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomRadioPage extends StatelessWidget {
  final List<String> options;

  const CustomRadioPage({super.key, required this.options});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => OptionCubit(),
      child: BlocBuilder<OptionCubit, int>(
          builder: (context, selectedIndex) {
            final cubit = context.read<OptionCubit>();

            return ListView.builder(
              padding: EdgeInsets.all(16),
              itemCount: options.length,
              itemBuilder: (context, index) {
                final isSelected = selectedIndex == index;

                return GestureDetector(
                  onTap: () => cubit.selectOption(index),
                  child: Container(
                    margin: EdgeInsets.only(bottom: 12),
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                    decoration: BoxDecoration(
                      color: isSelected ? Colors.blue.shade100 : Colors.white,
                      border: Border.all(
                        color: isSelected ? Colors.blue : Colors.grey,
                        width: isSelected ? 2 : 1,
                      ),
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        if (isSelected)
                          BoxShadow(
                            color: Colors.blue.withOpacity(0.3),
                            blurRadius: 6,
                            offset: Offset(0, 2),
                          ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          options[index],
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                          ),
                        ),
                        Icon(
                          isSelected
                              ? Icons.radio_button_checked
                              : Icons.radio_button_unchecked,
                          color: isSelected ? Colors.blue : Colors.grey,
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),
    );
  }
}
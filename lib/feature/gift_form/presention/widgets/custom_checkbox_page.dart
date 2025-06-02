// lib/pages/custom_checkbox_page.dart
import 'package:ai_recommend_gift/feature/gift_form/logic/checkbox_cubit/checkbox_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class CustomCheckboxPage extends StatelessWidget {
  final List<String> options;
  const CustomCheckboxPage({super.key, required this.options});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => MultiSelectCubit(options.length),
      child: BlocBuilder<MultiSelectCubit, List<bool>>(
          builder: (context, selectedList) {
            final cubit = context.read<MultiSelectCubit>();

            return ListView.builder(
              padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
              itemCount: options.length,
              itemBuilder: (context, index) {
                final isChecked = selectedList[index];

                return GestureDetector(
                  onTap: () => cubit.toggleOption(index),
                  child: Container(
                    margin: EdgeInsets.only(bottom: 12),
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                    decoration: BoxDecoration(
                      color: isChecked ? Colors.green.shade100 : Colors.white,
                      border: Border.all(
                        color: isChecked ? Colors.green : Colors.grey,
                        width: isChecked ? 2 : 1,
                      ),
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        if (isChecked)
                          BoxShadow(
                            color: Colors.green.withOpacity(0.3),
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
                            fontWeight:
                                isChecked ? FontWeight.bold : FontWeight.normal,
                          ),
                        ),
                        Icon(
                          isChecked
                              ? Icons.check_box
                              : Icons.check_box_outline_blank,
                          color: isChecked ? Colors.green : Colors.grey,
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

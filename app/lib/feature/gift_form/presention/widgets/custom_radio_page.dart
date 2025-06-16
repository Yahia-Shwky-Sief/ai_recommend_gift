import 'package:ai_recommend_gift/feature/gift_form/logic/radio_cubit/radio_cubit.dart';
import 'package:ai_recommend_gift/feature/gift_form/presention/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomRadioPage extends StatelessWidget {
  final List<List> options;
  final Function(String) onOptionSelected;
  final String title;

  const CustomRadioPage({
    super.key,
    required this.title,
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
          return SingleChildScrollView(
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: options.length / 2 * 300 + 200,
              child: Column(
                children: [
                  SizedBox(height: 16),
                  Text(
                    title,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 16),
                  SizedBox(
                    width: options.length * 200 + 32,
                    child: GridView.builder(
                      shrinkWrap: true,
                      padding: EdgeInsets.all(16),
                      itemCount: options.length,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        print(selectedIndex);
                        bool isSelected = selectedIndex == index;
                        return GestureDetector(
                          onTap: () {
                            cubit.selectOption(index);
                            onOptionSelected(options[index][1]);
                          },
                          child: buttonWidget(
                            data: options[index],
                            isSelected: isSelected,
                            context: context,
                            isRadioButton: true,
                          ),
                        );
                      },
                      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 200,
                        mainAxisExtent: 250,
                        childAspectRatio: 1,
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

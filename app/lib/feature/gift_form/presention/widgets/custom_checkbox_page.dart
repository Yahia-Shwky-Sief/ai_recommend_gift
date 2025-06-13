import 'package:ai_recommend_gift/feature/gift_form/logic/checkbox_cubit/checkbox_cubit.dart';
import 'package:ai_recommend_gift/feature/gift_form/presention/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomCheckboxPage extends StatelessWidget {
  final List<List> options;
  final Function(List<String>) onOptionSelected;
  final String title;
  const CustomCheckboxPage({
    super.key,
    required this.options,
    required this.onOptionSelected,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => MultiSelectCubit(options.length),
      child: BlocBuilder<MultiSelectCubit, List<bool>>(
        builder: (context, selectedList) {
          final cubit = context.read<MultiSelectCubit>();

          return SizedBox(
            width: MediaQuery.of(context).size.width,
            height: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: options.length * 200 + 32,
                  child: GridView.builder(
                    shrinkWrap: true,
                    padding: EdgeInsets.all(16),
                    itemCount: options.length,
                    itemBuilder: (context, index) {
                      final isSelected = selectedList[index];
                      return GestureDetector(
                        onTap: () {
                          cubit.toggleOption(index);
                          List<String> selectedOptions = [];
                          for (var i = 0; i < cubit.state.length; i++) {
                            if (cubit.state[i]) {
                              selectedOptions.add(options[i][1]);
                            }
                          }
                          onOptionSelected(selectedOptions);
                        },
                        child: buttonWidget(
                          data: options[index],
                          isSelected: isSelected,
                          context: context,
                          isRadioButton: false,
                        ),
                      );
                    },
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 300,
                      mainAxisExtent: 300,
                      childAspectRatio: 1,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

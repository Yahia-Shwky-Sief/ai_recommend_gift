import 'package:flutter/material.dart';

Widget buttonWidget({
  required List data,
  required bool isSelected,
  required BuildContext context,
  required bool isRadioButton,
}) {
  return Container(
    width: 200,
    height: 300,
    decoration: BoxDecoration(
      border: Border.all(
        color: isSelected
            ? ColorScheme.of(context).primary
            : Colors.grey.shade300,
        width: isSelected ? 2 : 1,
      ),
      borderRadius: BorderRadius.circular(12),
    ),
    child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Icon(
                isRadioButton
                    ? isSelected
                          ? Icons.radio_button_checked
                          : Icons.radio_button_unchecked
                    : isSelected
                    ? Icons.check_box
                    : Icons.check_box_outline_blank,
                color: isSelected
                    ? ColorScheme.of(context).primary
                    : Colors.grey.shade300,
              ),
            ],
          ),
        ),
        Image.asset(data[0], width: 150, height: 150, fit: BoxFit.cover),
        Text(
          data[1],
          style: TextStyle(
            fontSize: 18,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ],
    ),
  );
}

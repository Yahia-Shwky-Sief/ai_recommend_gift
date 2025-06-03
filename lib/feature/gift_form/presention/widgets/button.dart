import 'package:flutter/material.dart';

Widget buttonWidget({
  required List data,
  required bool isSelected,
  required BuildContext context,

}) {
  return Container(
                    width: 200,
                    height: 250,
                    margin: EdgeInsets.only(bottom: 12),
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: isSelected ? ColorScheme.of(context).secondary : ColorScheme.of(context).surface,
                        width: isSelected ? 2 : 1,
                      ),
                      borderRadius: BorderRadius.circular(12),
                      
                    ),
                    child: Column(
                      children: [
                        Icon(
                          isSelected
                              ? Icons.radio_button_checked
                              : Icons.radio_button_unchecked,
                          color: isSelected ? ColorScheme.of(context).secondary : ColorScheme.of(context).surface,
                        ),
                        Image.asset(
                          data[0],
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                        Text(
                          data[1],
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: isSelected
                                ? FontWeight.bold
                                : FontWeight.normal,
                          ),
                        ),
                        
                      ],
                    ),
                  );
}

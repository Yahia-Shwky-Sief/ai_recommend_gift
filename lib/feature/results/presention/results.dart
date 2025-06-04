import 'package:flutter/material.dart';

class Results extends StatelessWidget {
  const Results({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Column(
      children: [
        Text(
          'Results',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 20),
        Text(
          'Here are the recommended gifts based on your selections:',
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey[700],
          ),
        ),
        SizedBox(height: 20),

      ],
    );
  }
}
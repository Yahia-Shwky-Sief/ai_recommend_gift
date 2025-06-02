import 'package:ai_recommend_gift/core/theme/app_palette.dart';
import 'package:flutter/material.dart';

class Gender extends StatelessWidget {
  const Gender({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            
          },
          child: Container(
            width: 200,
            height: 250,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              border: Border.all(width: 2.0),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.circle_outlined,
                        size: 25,
                        color: AppPalette.accent,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: 150,
                  height: 150,
                  child: Image.asset('assets/images/download.png'),
                ),
                Text(
                  'Select',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    overflow: TextOverflow.ellipsis,
                  ),
                  maxLines: 1,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

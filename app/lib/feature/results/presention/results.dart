import 'package:ai_recommend_gift/feature/results/logic/get_results.dart';
import 'package:flutter/material.dart';

class Results extends StatelessWidget {
  final String gender;
  final String age;
  final String relationship;
  final String budget;
  final String occasion;
  final List interests;
  const Results({
    super.key,
    required this.gender,
    required this.age,
    required this.relationship,
    required this.budget,
    required this.occasion,
    required this.interests,
  });
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: Column(
        children: [
          Text(
            'Results',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          Text(
            'Here are the recommended gifts based on your selections:',
            style: TextStyle(fontSize: 16, color: Colors.grey[700]),
          ),
          SizedBox(height: 20),
          FutureBuilder(future: getResults(), builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              return Text('AI Response: ${snapshot.data}');
            }
          }),
        ],
      ),
    );
  }
}

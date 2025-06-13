import 'package:ai_recommend_gift/feature/results/logic/get_results.dart';
import 'package:ai_recommend_gift/feature/results/model/gift_recommendtion_model.dart';
import 'package:flutter/material.dart';

class Results extends StatelessWidget {
  final String gender;
  final String age;
  final String relationship;
  final String budget;
  final String occasion;
  final List<String> interests;
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
          Text('this was your choices: $gender, $age, $relationship, $budget, $occasion, ${interests.join(', ')}'),
          Text(
            'Here are the recommended gifts based on your selections:',
            style: TextStyle(fontSize: 16, color: Colors.grey[700]),
          ),
          SizedBox(height: 20),
          FutureBuilder(
            future: getResults(
              gender: gender,
              age: age,
              relationship: relationship,
              budget: budget,
              occasion: occasion,
              interests: interests.join(', ') // Convert list to string,
            ),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              } else if (snapshot.hasData) {
                final List<GiftRecommendation> gifts = parseGiftRecommendationsResponse(snapshot.data.toString());
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: gifts.length,
                  itemBuilder: (context, index) {
                    final gift = gifts[index];
                    return ListTile(
                      title: Text(gift.giftName),
                      subtitle: Text('Price: ${gift.priceRange}, Description: ${gift.description}'), 
                      onTap: () {
                        // Handle gift selection
                      },
                    );
                  },
                );
              }
              return Text(
                'Error: ${snapshot.error}',
                style: TextStyle(color: Colors.red),
              );
            },
          ),
        ],
      ),
    );
  }
}

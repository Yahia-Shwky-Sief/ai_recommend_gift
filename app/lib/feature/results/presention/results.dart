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
            future: getResultsMockup(
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
                //final List<GiftRecommendation> gifts = parseGiftRecommendationsResponse(snapshot.data.toString());
                final List<GiftRecommendation> gifts = snapshot.data as List<GiftRecommendation>;
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

getResultsMockup({
  required gender,
  required age,
  required relationship,
  required budget,
  required occasion,
  required interests,
}) async {
  await Future.delayed(Duration(seconds: 2));
  return [
    GiftRecommendation(
      giftName: 'Smart Watch',
      priceRange: '\$100 - \$200',
      description: 'A stylish smart watch with fitness tracking features.',
    ),
    GiftRecommendation(
      giftName: 'Wireless Earbuds',
      priceRange: '\$50 - \$150',
      description: 'High-quality wireless earbuds with noise cancellation.',
    ),
    GiftRecommendation(
      giftName: 'Personalized Mug',
      priceRange: '\$10 - \$30',
      description: 'A custom mug with a personal message or photo.',
    ),
  ];
}

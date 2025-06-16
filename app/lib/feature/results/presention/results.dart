import 'package:ai_recommend_gift/core/widgets/logo.dart';
import 'package:ai_recommend_gift/feature/home/home.dart';
import 'package:ai_recommend_gift/feature/results/model/gift_recommendtion_model.dart';
import 'package:ai_recommend_gift/feature/theme/presention/theme_toggle.dart';
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
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: logo(context),
        actions: [ThemeToggle()],
      ),
      body: Column(
        children: [
          SizedBox(height: 24),
          Text(
            'Results',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16),
          FutureBuilder(
            future: getResultsMockup(
              gender: gender,
              age: age,
              relationship: relationship,
              budget: budget,
              occasion: occasion,
              interests: interests.join(', '), // Convert list to string,
            ),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return SizedBox(
                  height: MediaQuery.of(context).size.height * 0.5,
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              } else if (snapshot.hasData) {
                //final List<GiftRecommendation> gifts = parseGiftRecommendationsResponse(snapshot.data.toString());
                final List<GiftRecommendation> gifts =
                    snapshot.data as List<GiftRecommendation>;
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: gifts.length,
                  itemBuilder: (context, index) {
                    final gift = gifts[index];
                    return Center(
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width *0.9,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              gift.giftName,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                            Text(
                              gift.priceRange,
                              style: TextStyle(
                                color: Colors.grey[600],
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                              ),
                            ), 
                            SizedBox(height: 8),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16.0),
                              child: Text(
                                gift.description,
                                style: TextStyle(
                                  color: Theme.of(context).brightness == Brightness.light? Colors.grey[800] : Colors.grey[400],
                                  fontSize: 14,
                                ),
                              ),
                            ),
                            SizedBox(height: 24),
                          ],
                        ),
                      ),
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
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(32),
              gradient: LinearGradient(
                colors: [
                  Theme.of(context).primaryColorDark,
                  Theme.of(context).primaryColorLight,
                ],
                stops: const [0.85, 1],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: MaterialButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => Home()),
                );
              },
              child: Text(
                'Back to Home',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
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

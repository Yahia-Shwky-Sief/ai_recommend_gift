import 'dart:convert';

/// Represents a single gift recommendation with its details.
class GiftRecommendation {
  final String giftName;
  final String description;
  final String priceRange;
  // Note: Your example JSON didn't include "giftPicture" for all items,
  // so I'm making it nullable. If it's always present, you can make it non-nullable.
  final String? giftPicture;

  GiftRecommendation({
    required this.giftName,
    required this.description,
    required this.priceRange,
    this.giftPicture, // This is now nullable
  });

  /// Creates a GiftRecommendation object from a JSON map.
  factory GiftRecommendation.fromJson(Map<String, dynamic> json) {
    return GiftRecommendation(
      giftName: json['giftName'] as String,
      description: json['description'] as String,
      priceRange: json['priceRange'] as String,
    );
  }

  /// Converts a GiftRecommendation object back to a JSON map.
  Map<String, dynamic> toJson() {
    return {
      'giftName': giftName,
      'description': description,
      'priceRange': priceRange,
    };
  }

  @override
  String toString() {
    return 'GiftRecommendation(name: $giftName, price: $priceRange)';
  }
}

List<GiftRecommendation> parseGiftRecommendationsResponse(String jsonString) {
  // 1. Decode the outer JSON string to a Map.
  // This gives us: { "response": "[...inner JSON string...]" }
  final Map<String, dynamic> outerMap = jsonDecode(jsonString);

  // 2. Get the value of the "response" key, which is itself a JSON string.
  final String innerJsonString = outerMap['response'] as String;

  // 3. Decode the inner JSON string to a List of maps.
  // This gives us: [ {gift1}, {gift2}, ... ]
  final List<dynamic> innerList = jsonDecode(innerJsonString);

  // 4. Map each item in the list to a GiftRecommendation object.
  return innerList.map((item) => GiftRecommendation.fromJson(item as Map<String, dynamic>)).toList();
}
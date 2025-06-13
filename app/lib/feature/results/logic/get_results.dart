import 'dart:convert';

import 'package:dio/dio.dart';

Future<String> getResults({
  required String gender,
  required String age,
  required String relationship,
  required String budget,
  required String occasion,
  required String interests,
}) async {
  final dio = Dio();
  const backendUrl =
      'http://localhost:3000'; // Replace with backend URL if needed
  final response = await dio.post(
    '$backendUrl/api/v1/ai/ai_response/',
    options: Options(headers: {'Content-Type': 'application/json'}),
    data: {
      "gender": gender,
      "age": age,
      "relationship": relationship,
      "budget": budget,
      "occasion": occasion,
      "interests": interests,
    },
  );
  if (response.statusCode != 200) {
    return 'Error: ${response.statusCode} - ${response.statusMessage}';
  } else {
    return response.toString();
  }
}

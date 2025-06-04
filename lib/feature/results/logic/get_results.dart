import 'package:ai_recommend_gift/core/const/openai_secretkey.dart';
import 'package:dio/dio.dart';

Future<String> getResults() async {
  final dio = Dio();
  const url = 'https://api.openai.com/v1/responses/';
    final response = await dio.post(
      url,
      options: Options(
        validateStatus: (status) => status! < 500,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $apiKey',
        },
      ),
      data: {
        "model": "gpt-3.5-turbo",
        "messages": [
          {"role": "user", "content": "Write a one-sentence bedtime story about a unicorn."}
        ],
        "max_tokens": 100,
        "temperature": 0.7,
      },
    );
    print(response);

    if (response.statusCode == 307) {
      final redirectUrl = response.headers['location']?.first;
      if (redirectUrl != null) {
        final redirectedResponse = await dio.post(
          redirectUrl,
          options: Options(
            headers: {
              'Content-Type': 'application/json',
              'Authorization': 'Bearer $apiKey',
            },
          ),
          data: response.requestOptions.data,
        );
        return redirectedResponse.data['choices'][0]['message']['content'];
      } else {
        return 'Redirect failed: No location header';
      }
    }

    return response.data['choices'][0]['message']['content'];
}

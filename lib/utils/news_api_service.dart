import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class NewsApiService {
  final String _baseUrl = 'https://newsapi.org/v2/top-headlines';
  final String _apiKey = dotenv.env['API_KEY']!;

  Future<List<dynamic>> fetchNews() async {
    final response = await http
        .get(Uri.parse('$_baseUrl?sources=the-times-of-india&apiKey=$_apiKey'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      return data['articles'];
    } else {
      throw Exception('Failed to load news');
    }
  }
}

import 'dart:convert';
import 'package:http/http.dart' as http;
import './article.dart';

class ApiHelper {
  static Future<ArticleList> fetchTopNews() async {
    final response =
        await http.get('https://newsapi.org/v2/top-headlines?country=us&apiKey=893002e3d88d4d5d90ca13795fcd4943');

    if (response.statusCode == 200) {
      return ArticleList.fromJson(json.decode(response.body.toString()));
    } else {
      throw Exception('Failed to load album');
    }
  }
}

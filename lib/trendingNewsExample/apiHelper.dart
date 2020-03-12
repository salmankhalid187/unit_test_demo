import 'dart:convert';
import 'package:http/http.dart' as http;
import './article.dart';

final String newsApiUrl = 'https://newsapi.org/v2/top-headlines?country=us&apiKey=893002e3d88d4d5d90ca13795fcd4943';

class ApiHelper {
  static Future<ArticleList> fetchTopNews(http.Client client) async {
    final response =
        await client.get(newsApiUrl);

    if (response.statusCode == 200) {
      return ArticleList.fromJson(json.decode(response.body.toString()));
    } else {
      throw Exception('Failed to load album');
    }
  }
}

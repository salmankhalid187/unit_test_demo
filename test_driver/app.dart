import 'package:http/http.dart' as http;
import 'package:flutter_driver/driver_extension.dart';
import 'package:mockito/mockito.dart';
import 'package:unit_test_demo/main.dart' as app;
import 'package:unit_test_demo/trendingNewsExample/globals.dart';

final String newsApiUrl = 'https://newsapi.org/v2/top-headlines?country=us&apiKey=893002e3d88d4d5d90ca13795fcd4943';
final String mockResponseString = '{"status":"ok","totalResults":38,"articles":[{"source":{"id":"cnn","name":"CNN"},"title":"Boston conference is the epicenter of state\'s coronavirus outbreak as Massachusetts governor declares state of emergency - CNN","description":"Massachusetts\' coronavirus cases have more than doubled and the state\'s governor declared a state of emergency after employees who attended a company meeting in Boston last month tested positive for the virus.","url":"https://www.cnn.com/2020/03/11/health/coronavirus-massachusetts-state-of-emergency/index.html","urlToImage":"https://cdn.cnn.com/cnnnext/dam/assets/200310233801-charlie-baker-massachusetts-0310-super-tease.jpg"}]}';

class MockClient extends Mock implements http.Client {}

void main() {
  enableFlutterDriverExtension();

  final MockClient client = new MockClient();
  when(client.get(newsApiUrl)).thenAnswer((_) async => http.Response(mockResponseString, 200));
  httpClient = client;

  app.main();
}

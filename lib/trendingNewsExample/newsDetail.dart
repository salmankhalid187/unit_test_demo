import 'package:flutter/material.dart';
import 'package:unit_test_demo/trendingNewsExample/article.dart';

class NewsDetailWidget extends StatelessWidget {
  final Article article;

  NewsDetailWidget(this.article);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Article Detail"),
      ),
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(this.article.title, textScaleFactor: 1.5),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.network(this.article.imageUrl),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(this.article.description, textAlign: TextAlign.center,),
        ),
      ]),
    );
  }
}

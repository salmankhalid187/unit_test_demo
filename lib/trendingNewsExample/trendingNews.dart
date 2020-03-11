import 'package:flutter/material.dart';
import 'package:unit_test_demo/trendingNewsExample/article.dart';
import './apiHelper.dart';

class TrendingNews extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TrendingNewsState();
  }
}

class TrendingNewsState extends State<TrendingNews> {
  Future<ArticleList> futureArticleList;

  @override
  void initState() {
    futureArticleList = ApiHelper.fetchTopNews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Trending News"),
        ),
        body: FutureBuilder<ArticleList>(
            future: futureArticleList,
            builder: (context, snapShot) {

              if (!snapShot.hasData) {
                return Center(
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.white,
                  )
                );
              }

              List<Article> articleList = snapShot.data.articlesList;
              return ListView.separated(
                separatorBuilder: (context, index) =>
                    Divider(color: Colors.black),
                padding: const EdgeInsets.all(8),
                itemCount: articleList.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: ListTile(
                      title: Text(articleList[index].title),
                      onTap: () {
                        print("Item Clicked");
                      },
                    ),
                  );
                },
              );
            }));
  }
}

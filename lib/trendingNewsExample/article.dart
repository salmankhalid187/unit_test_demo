
class ArticleList {
  
  List<Article> articlesList;

  ArticleList(this.articlesList);

  factory ArticleList.fromJson(Map<String, dynamic> json) {

    var articlesFromJson = json['articles'] as List;

    List<Article> articlesList = articlesFromJson.map((i) => Article.fromJson(i)).toList();

    return ArticleList(articlesList);
  }
}


class Article {

  final String title;
  final String description;
  final String imageUrl;

  Article({this.title, this.description, this.imageUrl});

  @override
  String toString() {
    return title;
  }

  factory Article.fromJson(Map<String, dynamic> json){
    return Article(title: json['title'], description: json['description'], imageUrl: json['urlToImage']);
  }
}
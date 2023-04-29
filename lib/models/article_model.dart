import 'source_model.dart';

class ArticleModel {
  SourceModel? source;
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String? content;

  ArticleModel({
    this.source,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });

  factory ArticleModel.fromMap(Map<String, dynamic> map) {
    return ArticleModel(
      source: map['source'] != null
          ? SourceModel.fromMap(map['source'] as Map<String, dynamic>)
          : null,
      author: map['author'] != null
          ? map['author'] as String
          : "Author not available",
      title:
          map['title'] != null ? map['title'] as String : "Title not available",
      description: map['description'] != null
          ? map['description'] as String
          : "Description not available",
      url: map['url'] != null
          ? map['url'] as String
          : "https://www.heise.de/news/Online-Workshop-Plattformuebergreifende-mobile-Apps-mit-Flutter-entwickeln-8116193.html",
      urlToImage: map['urlToImage'] != null
          ? map['urlToImage'] as String
          : "https://storage.googleapis.com/cms-storage-bucket/0dbfcc7a59cd1cf16282.png",
      publishedAt: map['publishedAt'] != null
          ? map['publishedAt'] as String
          : "Publication not available",
      content: map['content'] != null
          ? map['content'] as String
          : "Content not available",
    );
  }
}

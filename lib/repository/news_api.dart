// ignore_for_file: avoid_print

import 'dart:convert';
import '../models/article_model.dart';
import '../models/articles_list_model.dart';
import '../repository/abstract_class_repository.dart';
import 'package:http/http.dart' as http;

class NewsApi extends ClassRepository {
  var apiKey = "c75aba3a644b4eb29822eae5d9883f4f";

  @override
  Future<List<ArticleModel>> getAllNews() async {
    try {
      var url =
          ("https://newsapi.org/v2/top-headlines?country=us&apiKey=$apiKey");
      http.Response response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        String data = response.body;
        var jsonData = jsonDecode(data);
        ArticlesListModel articles = ArticlesListModel.fromMap(jsonData);
        List<ArticleModel> articlesListModel =
            articles.articles!.map((e) => ArticleModel.fromMap(e)).toList();
        return articlesListModel;
      } else {
        print("status code = ${response.statusCode}");
      }
    } catch (e) {
      print(e);
    }
    throw Exception("Exception code status");
  }

  @override
  Future<List<ArticleModel>> getCategory(String category) async {
    try {
      var url =
          ("https://newsapi.org/v2/top-headlines?country=us&category=$category&apiKey=$apiKey");
      http.Response response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        String data = response.body;
        var jsonData = jsonDecode(data);
        ArticlesListModel articles = ArticlesListModel.fromMap(jsonData);
        List<ArticleModel> articlesListModel =
            articles.articles!.map((e) => ArticleModel.fromMap(e)).toList();
        return articlesListModel;
      } else {
        print("status code = ${response.statusCode}");
      }
    } catch (e) {
      print(e);
    }
    throw Exception("Exception code status");
  }
}

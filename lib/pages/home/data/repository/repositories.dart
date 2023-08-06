import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/news_model.dart';

import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/news_model.dart';

class NewsRepository {
  final List<String> selectedTopics;
  NewsRepository({required this.selectedTopics});

  Future<List<ArticleModel>> fetchNews() async {
    // final queryParams = {'category': selectedTopics.join(',')};
    Uri uri = Uri.parse(
        'https://newsapi.org/v2/top-headlines?country=us&apiKey=ab3b6086568c4c00ad6c843bf2aa2cf5');
    // uri = uri.replace(
    //     queryParameters: queryParams); // Assign the updated URI back to `uri`

    var response = await http.get(uri); // Use http.get for GET request

    var data = jsonDecode(response.body);

    List<ArticleModel> _articleModelList = [];

    if (response.statusCode == 200) {
      for (var item in data["articles"]) {
        ArticleModel _artcileModel = ArticleModel.fromJson(item);
        _articleModelList.add(_artcileModel);
      }
      return _articleModelList;
    } else {
      return _articleModelList; // empty list
    }
  }
}

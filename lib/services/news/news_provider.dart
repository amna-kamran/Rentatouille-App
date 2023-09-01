import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';
import 'package:rentatouille/model/news_data.dart';

class NewsProvider with ChangeNotifier {
  int selectedTabIndex = 0;

  static NewsProvider s(BuildContext context) =>
      Provider.of<NewsProvider>(context, listen: true);

  List<News> newsArticleList = [];
  Future<void> fetchNews(String uri) async {
    try {
      Response response = await get(Uri.parse(uri));
      Map data = jsonDecode(response.body);
      List newsArticles = data["articles"];
      newsArticleList =
          newsArticles.map((articleObj) => News.fromMap(articleObj)).toList();
      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }
}

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';
import 'package:rentatouille/model/news_data.dart';

class NewsProvider with ChangeNotifier {
  int selectedTabIndex = 0;

  static NewsProvider s(BuildContext context) =>
      Provider.of<NewsProvider>(context, listen: true);

  List<News> topNewsList = [];
  List<News> recentNewsList = [];

  Future<List<News>> fetchDataAndUpdateList(String uri) async {
    try {
      Response response = await get(Uri.parse(uri));
      Map data = jsonDecode(response.body);
      List newsArticles = data["articles"];
      List<News> targetList =
          newsArticles.map((articleObj) => News.fromMap(articleObj)).toList();

      return targetList;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> fetchTopNews(String uri) async {
    List<News> updatedList = await fetchDataAndUpdateList(uri);
    topNewsList = updatedList;
    notifyListeners();
  }

  Future<void> fetchRecentNews(String uri) async {
    List<News> updatedList = await fetchDataAndUpdateList(uri);
    recentNewsList = updatedList;
    notifyListeners();
  }
}

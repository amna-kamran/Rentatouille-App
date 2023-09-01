import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:rentatouille/constants/url.dart';
import 'package:rentatouille/core/news/news_tile.dart';
import 'package:rentatouille/model/news_data.dart';
import 'package:rentatouille/services/news/news_provider.dart';

class RecentNewsList extends StatefulWidget {
  const RecentNewsList({
    super.key,
  });

  @override
  State<RecentNewsList> createState() => _RecentNewsListState();
}

class _RecentNewsListState extends State<RecentNewsList> {
  @override
  void initState() {
    super.initState();
    Provider.of<NewsProvider>(context, listen: false).fetchRecentNews(URL.news);
  }

  @override
  Widget build(BuildContext context) {
    final newsProvider = Provider.of<NewsProvider>(context);

    List<News>? topNews = newsProvider.recentNewsList;

    return Column(
      children: topNews.map((e) => NewsTile(news: e)).toList(),
    );
  }
}

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:rentatouille/constants/url.dart';
import 'package:rentatouille/core/news/news_tile.dart';
import 'package:rentatouille/model/news_data.dart';
import 'package:rentatouille/services/news/news_provider.dart';

class TopNewsList extends StatefulWidget {
  const TopNewsList({
    super.key,
  });

  @override
  State<TopNewsList> createState() => _TopNewsListState();
}

class _TopNewsListState extends State<TopNewsList> {
  @override
  void initState() {
    super.initState();
    Provider.of<NewsProvider>(context, listen: false).fetchNews(URL.news);
  }

  @override
  Widget build(BuildContext context) {
    final newsProvider = Provider.of<NewsProvider>(context);

    List<News>? topNews = newsProvider.newsArticleList;

    return Column(
      children: topNews.map((e) => NewsTile(news: e)).toList(),
    );
  }
}

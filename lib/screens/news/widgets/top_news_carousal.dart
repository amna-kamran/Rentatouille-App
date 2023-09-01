import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rentatouille/constants/url.dart';
import 'package:rentatouille/model/news_data.dart';
import 'package:rentatouille/services/news/news_provider.dart';

import 'top_news_card.dart';

class TopNewsCarousal extends StatefulWidget {
  const TopNewsCarousal({
    super.key,
  });

  @override
  State<TopNewsCarousal> createState() => _TopNewsCarousalState();
}

class _TopNewsCarousalState extends State<TopNewsCarousal> {
  @override
  void initState() {
    super.initState();
    Provider.of<NewsProvider>(context, listen: false).fetchTopNews(URL.topNews);
  }

  @override
  Widget build(BuildContext context) {
    final newsProvider = Provider.of<NewsProvider>(context);
    List<News>? topNews = newsProvider.topNewsList;
    return CarouselSlider.builder(
      itemCount: topNews.length,
      itemBuilder: (context, index, id) {
        return TopNewsCard(news: topNews[index]);
      },
      options: CarouselOptions(
        aspectRatio: 16 / 11,
        enableInfiniteScroll: false,
        enlargeCenterPage: true,
        viewportFraction: 1.0,
      ),
    );
  }
}

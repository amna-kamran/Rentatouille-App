import 'package:flutter/material.dart';
import 'package:rentatouille/constants/url.dart';
import 'package:rentatouille/model/news_data.dart';

class TopNewsCard extends StatefulWidget {
  const TopNewsCard({super.key, required this.news});
  final News news;
  @override
  State<TopNewsCard> createState() => _TopNewsCardState();
}

class _TopNewsCardState extends State<TopNewsCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(30),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(widget.news.imgURL ?? URL.missingImg),
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30.0),
            gradient: const LinearGradient(colors: [
              Colors.transparent,
              Colors.black,
            ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
          ),
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.news.newsTitle,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Text(
                widget.news.publishedBy,
                style: const TextStyle(
                  fontSize: 15,
                  color: Colors.grey,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

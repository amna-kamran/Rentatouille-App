import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:rentatouille/constants/spaces.dart';

import 'widgets/recent_news_list.dart';
import 'widgets/top_news_carousal.dart';

class NewsHomeScreen extends StatefulWidget {
  const NewsHomeScreen({Key? key}) : super(key: key);

  @override
  State<NewsHomeScreen> createState() => _NewsHomeScreenState();
}

class _NewsHomeScreenState extends State<NewsHomeScreen> {
  final date = DateTime.now();
  final ScrollController _scrollController = ScrollController();
  bool _showScrollToTopButton = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.offset >= 100) {
        setState(() {
          _showScrollToTopButton = true;
        });
      } else {
        setState(() {
          _showScrollToTopButton = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: _showScrollToTopButton
          ? FloatingActionButton(
              onPressed: () {
                _scrollController.animateTo(
                  0,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeInOut,
                );
              },
              child: const Icon(Icons.arrow_upward),
            )
          : null,
      body: SafeArea(
        child: SingleChildScrollView(
          controller: _scrollController,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  DateFormat('EEEE, d MMM, yyyy').format(date).toString(),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),
                Spaces.h5,
                const Text(
                  "Breaking News",
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.w500),
                ),
                Spaces.h15,
                const TopNewsCarousal(),
                Spaces.h15,
                const Row(
                  children: [
                    Text(
                      "Top News",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Spaces.w10,
                    Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 20,
                    ),
                  ],
                ),
                Spaces.h15,
                const RecentNewsList(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:rentatouille/constants/spaces.dart';

class CustomDropdown extends StatefulWidget {
  final String title;

  const CustomDropdown({
    super.key,
    required this.title,
  });
  @override
  CustomDropdownState createState() => CustomDropdownState();
}

class CustomDropdownState extends State<CustomDropdown> {
  bool isDropdownOpen = false;

  void toggleDropdown() {
    setState(() {
      isDropdownOpen = !isDropdownOpen;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        GestureDetector(
          onTap: toggleDropdown,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  widget.title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Icon(isDropdownOpen
                    ? Icons.arrow_drop_up
                    : Icons.arrow_drop_down),
              ],
            ),
          ),
        ),
        if (isDropdownOpen)
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
            ),
            child: Column(
              children: <Widget>[
                Spaces.h10,
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: userReviews.length,
                  itemBuilder: (BuildContext context, int index) {
                    final review = userReviews[index];
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 10,
                          ),
                          child: Text(review),
                        ),
                        if (index != userReviews.length - 1)
                          const Divider(
                            color: Colors.grey,
                            height: 1,
                          ),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
      ],
    );
  }

  final List<String> userReviews = [
    "Excellent",
    "Good",
    "Average",
    "Poor",
    "Terrible",
  ];
}

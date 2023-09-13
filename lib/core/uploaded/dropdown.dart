import 'package:flutter/material.dart';

class CustomDropdown extends StatefulWidget {
  final String title;
  final Widget child; // Add a child widget

  const CustomDropdown({
    Key? key,
    required this.title,
    required this.child, // Accept a child widget
  }) : super(key: key);

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
    return Flexible(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            onTap: toggleDropdown,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Icon(
                    isDropdownOpen
                        ? Icons.arrow_drop_down
                        : Icons.arrow_drop_up,
                  ),
                ],
              ),
            ),
          ),
          if (isDropdownOpen)
            Flexible(
              child: widget.child,
            ),
        ],
      ),
    );
  }
}

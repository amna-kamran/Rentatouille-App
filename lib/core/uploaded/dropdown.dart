import 'package:flutter/material.dart';

class CustomDropdown extends StatefulWidget {
  final String title;
  final Widget child;

  const CustomDropdown({
    Key? key,
    required this.title,
    required this.child,
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
    return Column(
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
                  isDropdownOpen ? Icons.arrow_drop_up : Icons.arrow_drop_down,
                ),
              ],
            ),
          ),
        ),
        if (isDropdownOpen)
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.2,
            width: double.infinity,
            child: widget.child,
          ),
      ],
    );
  }
}

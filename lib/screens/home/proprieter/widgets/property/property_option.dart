import 'package:flutter/material.dart';
import 'package:rentatouille/constants/spaces.dart';
import 'widgets/draft_screen.dart';
import 'widgets/tab_bar.dart';
import 'widgets/uploaded_screen.dart';

class PropertyOptionScreen extends StatefulWidget {
  const PropertyOptionScreen({super.key});

  @override
  PropertyOptionScreenState createState() => PropertyOptionScreenState();
}

class PropertyOptionScreenState extends State<PropertyOptionScreen> {
  int _currentIndex = 1;
  final List<Widget> _screens = [
    const DraftScreen(),
    const UploadedScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Spaces.h40,
            const Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                "My Properties",
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.w500),
              ),
            ),
            Spaces.h40,
            TabBarWithIndicator(
              currentIndex: _currentIndex,
              onTap: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              tabs: const [
                "Drafts",
                "Uploaded",
              ],
            ),
            Expanded(
              child: _screens[_currentIndex],
            ),
          ],
        ),
      ),
    );
  }
}

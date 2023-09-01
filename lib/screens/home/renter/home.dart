import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:provider/provider.dart';
import 'package:rentatouille/screens/home/renter/widgets/profile/profile.dart';
import 'package:rentatouille/screens/news/home.dart';
import 'package:rentatouille/services/bottom_navbar_provider.dart';
import 'widgets/property.dart';

class RenterHome extends StatelessWidget {
  const RenterHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Ionicons.file_tray_full_outline,
              size: 28,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Ionicons.home_outline,
              size: 28,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Ionicons.person_outline,
              size: 28,
            ),
            label: '',
          ),
        ],
        currentIndex:
            Provider.of<BottomNavigationBarProvider>(context).currentIndex,
        onTap: (int index) {
          Provider.of<BottomNavigationBarProvider>(context, listen: false)
              .currentIndex = index;
        },
        selectedIconTheme:
            const IconThemeData(color: Color.fromARGB(255, 26, 184, 92)),
        unselectedIconTheme: const IconThemeData(color: Colors.black54),
        showSelectedLabels: false,
        showUnselectedLabels: false,
      ),
      body: Consumer<BottomNavigationBarProvider>(
        builder: (context, bottomNavigationBarProvider, child) {
          return IndexedStack(
            index: bottomNavigationBarProvider.currentIndex,
            children: const [
              NewsHomeScreen(),
              PropertyScreen(),
              ProfileScreen(),
            ],
          );
        },
      ),
    );
  }
}

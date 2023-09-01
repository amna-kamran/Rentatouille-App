import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rentatouille/screens/news/home.dart';
import 'package:rentatouille/services/bottom_navbar_provider.dart';
import 'widgets/profile.dart';
import 'widgets/property.dart';

class RenterHome extends StatelessWidget {
  const RenterHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'Property',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex:
            Provider.of<BottomNavigationBarProvider>(context).currentIndex,
        onTap: (int index) {
          Provider.of<BottomNavigationBarProvider>(context, listen: false)
              .currentIndex = index;
        },
        selectedIconTheme: const IconThemeData(color: Colors.blue),
        unselectedIconTheme: const IconThemeData(color: Colors.grey),
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

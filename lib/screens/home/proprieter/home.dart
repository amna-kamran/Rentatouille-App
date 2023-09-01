import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rentatouille/services/bottom_navbar_provider.dart';
import 'widgets/profile.dart';
import 'widgets/rent_property.dart';

class ProprieterHome extends StatelessWidget {
  const ProprieterHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
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
      ),
      body: Consumer<BottomNavigationBarProvider>(
        builder: (context, bottomNavigationBarProvider, child) {
          return IndexedStack(
            index: bottomNavigationBarProvider.currentIndex,
            children: const [
              RentScreen(),
              ProfileScreen(),
            ],
          );
        },
      ),
    );
  }
}

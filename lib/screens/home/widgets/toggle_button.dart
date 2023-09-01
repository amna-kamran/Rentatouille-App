import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rentatouille/services/bottom_navbar_provider.dart';
import 'package:rentatouille/services/toggle_provider.dart';

class ToggleButtonApp extends StatefulWidget {
  const ToggleButtonApp({super.key});

  @override
  ToggleButtonAppState createState() => ToggleButtonAppState();
}

class ToggleButtonAppState extends State<ToggleButtonApp> {
  @override
  Widget build(BuildContext context) {
    final toggleProvider = Provider.of<ToggleProvider>(context);
    final bottomNavBarProvider =
        Provider.of<BottomNavigationBarProvider>(context);
    return Center(
      child: GestureDetector(
        onTap: () {
          toggleProvider.toggleMode();
          bottomNavBarProvider.resetIndex();
        },
        child: Container(
          width: 100,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: toggleProvider.isProprietorMode ? Colors.red : Colors.green,
          ),
          child: Align(
            alignment: toggleProvider.isProprietorMode
                ? Alignment.centerRight
                : Alignment.centerLeft,
            child: Container(
              width: 40,
              height: 40,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rentatouille/services/bottom_navbar_provider.dart';
import 'package:rentatouille/services/toggle_provider.dart';

class ToggleButtonApp extends StatefulWidget {
  const ToggleButtonApp({
    super.key,
  });

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
          padding: const EdgeInsets.only(right: 5, left: 5),
          width: 55,
          height: 25,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: toggleProvider.isProprietorMode
                ? Colors.green
                : Colors
                    .grey, // Change color to grey when not in proprietor mode
          ),
          child: Align(
            alignment: toggleProvider.isProprietorMode
                ? Alignment.centerRight
                : Alignment.centerLeft,
            child: Container(
              width: 20,
              height: 20,
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

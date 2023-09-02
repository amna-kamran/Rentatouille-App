import 'package:flutter/material.dart';

class TabBarWithIndicator extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;
  final List<String> tabs;

  const TabBarWithIndicator({
    required this.currentIndex,
    required this.onTap,
    required this.tabs,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: tabs.asMap().entries.map(
        (entry) {
          final index = entry.key;
          final text = entry.value;

          return Expanded(
            child: InkWell(
              onTap: () {
                onTap(index);
              },
              child: Container(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: currentIndex == index
                          ? Colors.green
                          : Colors.transparent,
                      width: 2.0,
                    ),
                  ),
                ),
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  text,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16.0,
                    color: currentIndex == index ? Colors.green : Colors.black,
                  ),
                ),
              ),
            ),
          );
        },
      ).toList(),
    );
  }
}

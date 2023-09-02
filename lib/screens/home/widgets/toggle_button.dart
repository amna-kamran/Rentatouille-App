import 'package:flutter/material.dart';

class ToggleButtonApp extends StatefulWidget {
  final bool initialValue;
  final Function(bool) onToggle;
  final Color activeColor;
  final Color inactiveColor;

  const ToggleButtonApp({
    Key? key,
    required this.initialValue,
    required this.onToggle,
    this.activeColor = Colors.green,
    this.inactiveColor = Colors.grey,
  }) : super(key: key);

  @override
  ToggleButtonAppState createState() => ToggleButtonAppState();
}

class ToggleButtonAppState extends State<ToggleButtonApp> {
  bool isToggled = false;

  @override
  void initState() {
    super.initState();
    isToggled = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          setState(() {
            isToggled = !isToggled;
          });
          widget.onToggle(isToggled);
        },
        child: Container(
          padding: const EdgeInsets.only(right: 5, left: 5),
          width: 55,
          height: 25,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: isToggled ? widget.activeColor : widget.inactiveColor,
          ),
          child: Align(
            alignment: isToggled ? Alignment.centerRight : Alignment.centerLeft,
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

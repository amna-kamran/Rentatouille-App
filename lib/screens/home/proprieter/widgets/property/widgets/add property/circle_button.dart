import 'package:flutter/material.dart';

class CircleButton extends StatelessWidget {
  final int number;
  final bool isSelected;
  final ValueChanged<int> onChanged;

  const CircleButton({
    super.key,
    required this.number,
    required this.isSelected,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (!isSelected) {
          onChanged(number);
        }
      },
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: isSelected
              ? Border.all(
                  color: Colors.green,
                  width: 2,
                )
              : null,
          color: Colors.grey[200],
        ),
        child: Center(
          child: Text(
            number.toString(),
            style: TextStyle(
              color: isSelected ? Colors.green : Colors.grey[800],
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class DraftScreen extends StatelessWidget {
  const DraftScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          padding: const EdgeInsets.all(20.0),
          width: double.infinity,
          decoration: const BoxDecoration(
            color: Colors.green,
          ),
          child: InkWell(
            onTap: () {},
            child: const Align(
              alignment: Alignment.center,
              child: Text(
                "Add Property",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

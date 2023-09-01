import 'package:flutter/material.dart';
import 'package:rentatouille/services/auth/auth_provider.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const Text("home"),
          OutlinedButton(
            onPressed: () {},
            child: Text(AuthProvider.getCurrentUserEmail().toString()),
          )
        ],
      ),
    );
  }
}

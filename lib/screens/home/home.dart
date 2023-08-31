import 'package:flutter/material.dart';
import 'package:rentatouille/services/auth/auth_provider.dart';
import 'package:rentatouille/services/auth/google%20auth/google_auth.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: [
        Text("home"),
        OutlinedButton(
          onPressed: () async {
            await GoogleAuthHelper.signOut();
            await AuthProvider.logout();
          },
          child: const Text("logout"),
        )
      ],
    ));
  }
}

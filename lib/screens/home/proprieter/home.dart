import 'package:flutter/material.dart';
import 'package:rentatouille/services/auth/auth_provider.dart';
import 'package:rentatouille/services/auth/google%20auth/google_auth.dart';

class ProprieterHome extends StatelessWidget {
  const ProprieterHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Proprieter"),
          OutlinedButton(
            onPressed: () async {
              await GoogleAuthHelper.signOut();
              await AuthProvider.logout();
            },
            child: Text(AuthProvider.getCurrentUserEmail().toString()),
          )
        ],
      ),
    );
  }
}

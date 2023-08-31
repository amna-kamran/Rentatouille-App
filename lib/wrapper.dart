import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rentatouille/model/auth_data.dart';
import 'package:rentatouille/screens/home/proprieter/home.dart';
import 'package:rentatouille/screens/home/renter/home.dart';
import 'package:rentatouille/screens/login/login.dart';
import 'package:rentatouille/services/auth/auth_provider.dart';

import 'services/toggle_provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    return StreamBuilder<AuthData?>(
      stream: authProvider.user,
      builder: (BuildContext context, AsyncSnapshot<AuthData?> snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          final AuthData? user = snapshot.data;
          return user == null
              ? const LoginScreen()
              : Consumer<ToggleProvider>(
                  builder: (context, provider, child) {
                    if (provider.isProprietorMode) {
                      return const ProprieterHome();
                    } else {
                      return const RenterHome();
                    }
                  },
                );
        } else {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }
      },
    );
  }
}

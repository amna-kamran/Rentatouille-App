import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rentatouille/model/auth_data.dart';
import 'package:rentatouille/screens/home/home.dart';
import 'package:rentatouille/screens/login/login.dart';
import 'package:rentatouille/services/auth/auth_provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    return StreamBuilder<AuthData?>(
      stream: authProvider.user,
      builder: (BuildContext context, AsyncSnapshot<AuthData?> snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          final AuthData? user = snapshot.data;
          return user == null ? const LoginScreen() : const Home();
        } else {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }
      },
    );
  }
}








// StreamBuilder(
//         stream: FirebaseAuth.instance.authStateChanges(),
//         builder: (context, snapshot) {
//           debugPrint(snapshot.hasData.toString());

//           if (snapshot.hasData && snapshot.data != null) {
//             return const Home();
//           } else {
//             return const LoginScreen();
//           }
//         },
//       ),
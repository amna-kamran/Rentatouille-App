import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:rentatouille/services/auth/auth_provider.dart';
import 'package:rentatouille/wrapper.dart';

import 'firebase_options.dart';
import 'services/bottom_navbar_provider.dart';
import 'services/toggle_provider.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ToggleProvider(),
        ),
        Provider<AuthProvider>(
          create: (_) => AuthProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => BottomNavigationBarProvider(),
        ),
      ],
      child: MaterialApp(
        scaffoldMessengerKey: AuthProvider.scaffoldMessengerKey,
        debugShowCheckedModeBanner: false,
        home: Wrapper(),
      ),
    );
  }
}

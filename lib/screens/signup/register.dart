import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:rentatouille/constants/spaces.dart';
import 'package:rentatouille/core/form_builder.dart';
import 'package:rentatouille/services/auth/auth_provider.dart';
import 'package:rentatouille/theme/colors.dart';

part 'widget/_body.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: _Body(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rentatouille/constants/spaces.dart';
import 'package:rentatouille/core/form_builder.dart';
import 'package:rentatouille/screens/login/widget/google_login_button.dart';
import 'package:rentatouille/screens/register/register.dart';

import 'package:rentatouille/services/auth/auth_provider.dart';
import 'package:rentatouille/theme/colors.dart';

part 'widget/_body.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      resizeToAvoidBottomInset: false,
      body: _Body(),
    );
  }
}

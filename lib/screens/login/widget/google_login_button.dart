import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rentatouille/constants/assets.dart';
import 'package:rentatouille/services/auth/auth_provider.dart';
import 'package:rentatouille/services/auth/google%20auth/google_auth.dart';
import 'package:rentatouille/theme/colors.dart';

class GoogleLoginButton extends StatelessWidget {
  const GoogleLoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.black,
      ),
      child: InkWell(
        onTap: () async {
          await GoogleAuthHelper.signInWithGoogle();
          AuthProvider.storeGoogleUserInfoInFirestore();
        },
        borderRadius: BorderRadius.circular(30),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: SvgPicture.asset(
                  Assets.googleSvg,
                  height: 20,
                  width: 20,
                ),
              ),
              const Expanded(
                child: Center(
                  child: Text(
                    "Login with Google",
                    style: TextStyle(
                      fontSize: 16,
                      color: CustomColors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

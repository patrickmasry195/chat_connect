import 'package:chat_connect/widgets/facebook_auth_button.dart';
import 'package:chat_connect/widgets/google_auth_button.dart';
import 'package:flutter/material.dart';

class SocialAuthButtons extends StatelessWidget {
  const SocialAuthButtons({
    super.key,
    this.googleAuthOnPressed,
    this.facebookAuthOnPressed,
  });
  final void Function()? googleAuthOnPressed;
  final void Function()? facebookAuthOnPressed;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GoogleAuthButton(
          googleAuthOnPressed: googleAuthOnPressed,
        ),
        const SizedBox(
          height: 20,
        ),
        FacebookAuthButton(
          facebookAuthOnPressed: facebookAuthOnPressed,
        ),
      ],
    );
  }
}

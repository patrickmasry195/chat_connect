import 'package:chat_connect/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class SocialAuthButtons extends StatelessWidget {
  const SocialAuthButtons({super.key, this.onPressed});
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomButton(
          onPressed: onPressed,
          fontSize: 24,
          iconPath: 'assets/google.png',
          text: 'Continue with Google',
          height: 50,
          width: 320,
        ),
        const SizedBox(
          height: 20,
        ),
        CustomButton(
          onPressed: onPressed,
          fontSize: 24,
          iconPath: 'assets/facebook.png',
          text: 'Continue with Facebook',
          height: 50,
          width: 320,
        ),
      ],
    );
  }
}

import 'package:chat_connect/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class GoogleAuthButton extends StatelessWidget {
  const GoogleAuthButton({super.key, this.googleAuthOnPressed});

  final void Function()? googleAuthOnPressed;

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      onPressed: googleAuthOnPressed,
      fontSize: 24,
      iconPath: 'assets/google.png',
      text: 'Continue with Google',
      height: 50,
      width: 320,
    );
  }
}

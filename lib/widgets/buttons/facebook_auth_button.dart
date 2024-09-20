import 'package:chat_connect/widgets/buttons/custom_button.dart';
import 'package:flutter/material.dart';

class FacebookAuthButton extends StatelessWidget {
  const FacebookAuthButton({super.key, this.facebookAuthOnPressed});
  final void Function()? facebookAuthOnPressed;

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      onPressed: facebookAuthOnPressed,
      fontSize: 24,
      iconPath: 'assets/facebook.png',
      text: 'Continue with Facebook',
      height: 50,
      width: 320,
    );
  }
}

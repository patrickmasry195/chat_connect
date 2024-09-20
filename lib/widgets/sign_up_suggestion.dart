import 'package:chat_connect/constants.dart';
import 'package:flutter/material.dart';

class SignUpSuggestion extends StatelessWidget {
  const SignUpSuggestion({super.key, this.onTap});
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Don\'t have account?',
          style: TextStyle(
            color: Colors.white,
            fontSize: 21,
          ),
        ),
        GestureDetector(
          onTap: onTap,
          child: const Text(' Sign up',
              style: TextStyle(
                color: kPrimaryColor,
                fontSize: 21,
              )),
        )
      ],
    );
  }
}

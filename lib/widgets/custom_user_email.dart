import 'package:chat_connect/helpers/constants.dart';
import 'package:flutter/material.dart';

class CustomUserEmail extends StatelessWidget {
  const CustomUserEmail(
      {super.key, this.onTap, required this.email, required this.fontSize});

  final void Function()? onTap;
  final String email;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        email,
        style: TextStyle(
          color: kFourthColor,
          fontSize: fontSize,
        ),
      ),
    );
  }
}

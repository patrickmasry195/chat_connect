import 'package:chat_connect/constants.dart';
import 'package:flutter/material.dart';

class CustomUserName extends StatelessWidget {
  const CustomUserName(
      {super.key, this.onTap, required this.name, required this.fontSize});

  final void Function()? onTap;
  final String name;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        name,
        style: TextStyle(
          color: kSecondaryColor,
          fontSize: fontSize,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

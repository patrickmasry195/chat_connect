import 'package:chat_connect/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
        style: GoogleFonts.jockeyOne(
          color: kFourthColor,
          fontSize: fontSize,
        ),
      ),
    );
  }
}

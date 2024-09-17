import 'package:chat_connect/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpSuggestion extends StatelessWidget {
  const SignUpSuggestion({super.key, this.onTap});
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Don\'t have account?',
          style: GoogleFonts.jockeyOne(
            color: Colors.white,
            fontSize: 21,
          ),
        ),
        GestureDetector(
          onTap: onTap,
          child: Text(
            ' Sign up',
            style: GoogleFonts.jockeyOne(
              color: kPrimaryColor,
              fontSize: 21,
            ),
          ),
        )
      ],
    );
  }
}

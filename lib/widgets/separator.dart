import 'package:chat_connect/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Separator extends StatelessWidget {
  const Separator({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'OR',
      style: GoogleFonts.jockeyOne(
        color: kSecondaryColor,
        fontSize: 21,
      ),
    );
  }
}

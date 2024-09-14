import 'package:chat_connect/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    required this.text,
    required this.onPressed,
    required this.icon,
  });

  final String text;
  final Function() onPressed;
  final IconData icon;

  @override
  Size get preferredSize => const Size(double.maxFinite, 56);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        onPressed: onPressed,
        icon: Icon(
          icon,
          color: kSecondaryColor,
        ),
      ),
      backgroundColor: kPrimaryColor,
      title: Text(
        text,
        style: GoogleFonts.jockeyOne(
          color: kSecondaryColor,
        ),
      ),
    );
  }
}

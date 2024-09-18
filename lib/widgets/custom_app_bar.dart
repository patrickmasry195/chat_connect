import 'package:chat_connect/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    required this.title,
    this.onPressed,
    this.icon,
    this.iconTheme, this.leading,
  });

  final String title;
  final Function()? onPressed;
  final IconData? icon;
  final IconThemeData? iconTheme;
  final Widget? leading;

  @override
  Size get preferredSize => const Size(double.maxFinite, 56);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: iconTheme,
      leading: leading,
      backgroundColor: kPrimaryColor,
      title: Text(
        title,
        style: GoogleFonts.jockeyOne(
          color: kSecondaryColor,
        ),
      ),
    );
  }
}

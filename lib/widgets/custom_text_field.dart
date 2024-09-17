import 'package:chat_connect/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.preIcon,
    required this.hintText,
    this.suffixIcon,
    required this.keyboardType,
    this.validator,
  });

  final IconData? preIcon;
  final IconData? suffixIcon;
  final String hintText;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      decoration: BoxDecoration(
        color: kThirdColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextFormField(
        validator: validator,
        keyboardType: keyboardType,
        cursorColor: kSecondaryColor,
        decoration: InputDecoration(
          alignLabelWithHint: true,
          prefixIcon: Icon(
            preIcon,
            color: kHintColor,
          ),
          suffixIcon: Icon(
            suffixIcon,
            color: kHintColor,
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: kPrimaryColor,
              width: 3,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(
              color: Colors.black,
              width: 3,
            ),
          ),
          border: const OutlineInputBorder(),
          hintText: hintText,
          hintStyle: GoogleFonts.jockeyOne(
            fontSize: 19,
            color: kHintColor,
          ),
        ),
      ),
    );
  }
}

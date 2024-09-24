import 'package:chat_connect/helpers/constants.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.preIcon,
    required this.hintText,
    this.suffixIcon,
    required this.keyboardType,
    this.obscureText = false,
    this.validator,
    this.controller,
  });

  final IconData? preIcon;
  final String hintText;
  final TextInputType keyboardType;
  final bool obscureText;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      child: TextFormField(
        controller: controller,
        style: const TextStyle(color: Colors.black),
        validator: validator,
        obscureText: obscureText,
        keyboardType: keyboardType,
        cursorColor: kSecondaryColor,
        decoration: InputDecoration(
          filled: true,
          fillColor: kThirdColor,
          alignLabelWithHint: true,
          prefixIcon: Icon(
            preIcon,
            color: kHintColor,
          ),
          suffixIcon: suffixIcon,
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
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          hintText: hintText,
          hintStyle: const TextStyle(
            fontSize: 19,
            color: kHintColor,
          ),
        ),
      ),
    );
  }
}

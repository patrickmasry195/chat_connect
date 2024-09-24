import 'package:flutter/material.dart';

void showSnackBar(
    BuildContext context, String message, Color? backgroundColor) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: backgroundColor,
      content: Text(message),
    ),
  );
}

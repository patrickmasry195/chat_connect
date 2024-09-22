import 'package:chat_connect/helpers/constants.dart';
import 'package:flutter/material.dart';

class CustomBackGroundForm extends StatelessWidget {
  const CustomBackGroundForm({
    super.key,
    required this.height,
    required this.width,
    this.child,
  });
  final Widget? child;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: kSecondaryColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: child,
    );
  }
}

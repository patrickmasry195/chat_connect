import 'package:chat_connect/helpers/constants.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    this.iconPath,
    this.textAlign,
    required this.fontSize,
    this.onPressed,
    required this.height,
    required this.width,
  });

  final String text;
  final String? iconPath;
  final TextAlign? textAlign;
  final double fontSize;
  final VoidCallback? onPressed;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      color: kPrimaryColor,
      onPressed: onPressed,
      disabledColor: null,
      child: SizedBox(
        width: width,
        height: height,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (iconPath != null)
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Image.asset(
                    iconPath!,
                    width: 30,
                    height: 30,
                  ),
                ),
              Expanded(
                child: Text(
                  text,
                  textAlign: textAlign,
                  style: TextStyle(
                    fontSize: fontSize,
                    color: kSecondaryColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

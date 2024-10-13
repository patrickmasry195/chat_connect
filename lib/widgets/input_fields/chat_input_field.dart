import 'package:chat_connect/helpers/constants.dart';
import 'package:flutter/material.dart';

class ChatInputField extends StatelessWidget {
  const ChatInputField({
    super.key,
    this.controller,
    this.onPressed,
  });

  final TextEditingController? controller;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SizedBox(
          width: 300,
          child: TextField(
            controller: controller,
            cursorColor: kSecondaryColor,
            style: const TextStyle(color: Colors.black),
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 10,
              ),
              filled: true,
              fillColor: kThirdColor,
              hintText: 'Type your message',
              hintStyle: const TextStyle(color: kHintColor),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: kSecondaryColor),
              ),
            ),
          ),
        ),
        const Spacer(
          flex: 2,
        ),
        SizedBox(
          height: 40,
          width: 40,
          child: ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.zero,
              backgroundColor: kSecondaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: const Icon(
              Icons.send,
              color: Colors.white,
            ),
          ),
        ),
        const Spacer(
          flex: 1,
        )
      ],
    );
  }
}

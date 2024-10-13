import 'package:chat_connect/helpers/constants.dart';
import 'package:flutter/material.dart';

class ReceivedChatBubble extends StatelessWidget {
  const ReceivedChatBubble({
    super.key,
    required this.message,
  });

  final String message;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding:
            const EdgeInsets.only(left: 16, top: 32, bottom: 32, right: 32),
        margin: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: kChatBubbleColor,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3),
              ),
            ]),
        child: Text(
          message,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

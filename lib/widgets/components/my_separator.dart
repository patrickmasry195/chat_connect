import 'package:chat_connect/constants.dart';
import 'package:flutter/material.dart';

class MySeparator extends StatelessWidget {
  const MySeparator({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'OR',
      style: TextStyle(
        color: kSecondaryColor,
        fontSize: 21,
      ),
    );
  }
}

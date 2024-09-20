import 'package:chat_connect/constants.dart';
import 'package:chat_connect/widgets/buttons/custom_button.dart';
import 'package:flutter/material.dart';

class GetStartedPage extends StatelessWidget {
  const GetStartedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(
              flex: 1,
            ),
            Image.asset(
              'assets/get_started.png',
              width: 318,
              height: 322,
            ),
            const Text(
              'Welcome to ChatConnect',
              style: TextStyle(
                fontSize: 30,
                color: kSecondaryColor,
              ),
            ),
            const Spacer(
              flex: 1,
            ),
            CustomButton(
              onPressed: () {
                Navigator.pushNamed(context, 'LoginPage');
              },
              text: 'Get Started',
              height: 50,
              width: 283,
              fontSize: 23,
              textAlign: TextAlign.center,
            ),
            const Spacer(
              flex: 1,
            ),
          ],
        ),
      ),
    );
  }
}

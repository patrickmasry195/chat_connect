import 'package:chat_connect/constants.dart';
import 'package:chat_connect/widgets/my_separator.dart';
import 'package:chat_connect/widgets/sign_up_form.dart';
import 'package:chat_connect/widgets/social_auth_buttons.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pushNamed(context, 'GetStartedPage');
          },
          icon: const Icon(
            Icons.arrow_back,
            color: kSecondaryColor,
          ),
        ),
        title: const Text(
          'Sign Up to ChatConnect',
          style: TextStyle(color: kSecondaryColor),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 18),
              child: Center(
                child: SignUpForm(),
              ),
            ),
            const MySeparator(),
            const SizedBox(
              height: 20,
            ),
            SocialAuthButtons(
              googleAuthOnPressed: () {},
              facebookAuthOnPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}

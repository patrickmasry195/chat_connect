import 'package:chat_connect/constants.dart';
import 'package:chat_connect/widgets/components/my_separator.dart';
import 'package:chat_connect/widgets/forms/sign_up_form.dart';
import 'package:chat_connect/widgets/buttons/social_auth_buttons.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pushNamed(context, 'LoginPage');
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

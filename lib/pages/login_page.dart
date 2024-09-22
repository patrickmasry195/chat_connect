import 'package:chat_connect/helpers/constants.dart';
import 'package:chat_connect/widgets/forms/login_form.dart';
import 'package:chat_connect/widgets/components/my_separator.dart';
import 'package:chat_connect/widgets/buttons/social_auth_buttons.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

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
          'Login to ChatConnect',
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
                child: LoginForm(),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const MySeparator(),
            const SizedBox(
              height: 20,
            ),
            SocialAuthButtons(
              facebookAuthOnPressed: () {
                Navigator.pushNamed(context, 'ChatsPage');
              },
              googleAuthOnPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}

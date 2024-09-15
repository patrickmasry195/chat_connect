import 'package:chat_connect/widgets/custom_app_bar.dart';
import 'package:chat_connect/widgets/login_form.dart';
import 'package:chat_connect/widgets/separator.dart';
import 'package:chat_connect/widgets/social_auth_buttons.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        icon: Icons.arrow_back,
        text: 'Login to ChatConnect',
        onPressed: () {
          Navigator.pushNamed(context, 'GetStartedPage');
        },
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
            const Separator(),
            const SizedBox(
              height: 20,
            ),
            SocialAuthButtons(
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}

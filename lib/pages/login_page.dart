import 'package:chat_connect/helpers/constants.dart';
import 'package:chat_connect/pages/chats_page.dart';
import 'package:chat_connect/widgets/buttons/google_auth_button.dart';
import 'package:chat_connect/widgets/forms/login_form.dart';
import 'package:chat_connect/widgets/components/my_separator.dart';
import 'package:flutter/material.dart';
import '../services/email_authentication.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  static String id = 'LoginPage';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
            GoogleAuthButton(
              googleAuthOnPressed: () async {
                await AuthService().signInWithGoogle();
                Navigator.pushNamed(context, ChatsPage.id);
              },
            ),
          ],
        ),
      ),
    );
  }
}

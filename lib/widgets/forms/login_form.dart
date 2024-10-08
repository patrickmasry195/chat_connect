import 'package:chat_connect/helpers/regex_validator.dart';
import 'package:chat_connect/pages/chats_page.dart';
import 'package:chat_connect/pages/sign_up_page.dart';
import 'package:chat_connect/widgets/components/custom_background_form.dart';
import 'package:chat_connect/widgets/buttons/custom_button.dart';
import 'package:chat_connect/widgets/forgot_password.dart';
import 'package:chat_connect/widgets/input_fields/custom_email_field.dart';
import 'package:chat_connect/widgets/input_fields/custom_password_field.dart';
import 'package:chat_connect/widgets/sign_up_suggestion.dart';
import 'package:flutter/material.dart';

import '../../helpers/show_snack_bar.dart';
import '../../services/email_authentication.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({
    super.key,
  });

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isLoading = false;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void _loginUser() async {
    String res = await AuthService().loginUser(
      email: emailController.text,
      password: passwordController.text,
    );
    if (res == "success") {
      setState(() {
        isLoading = true;
      });
      Navigator.pushNamed(context, ChatsPage.id);
    } else {
      setState(() {
        isLoading = false;
      });
      showSnackBar(context, res, Colors.red);
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomBackGroundForm(
      height: 400,
      width: 350,
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            CustomEmailField(
              emailController: emailController,
              emailValidator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your email';
                } else if (!emailRegex.hasMatch(value)) {
                  return 'Enter a valid email address';
                }
                return null;
              },
            ),
            const SizedBox(
              height: 20,
            ),
            CustomPasswordField(
              passwordController: passwordController,
              passwordValidator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your password';
                } else if (!passwordRegex.hasMatch(value)) {
                  return 'Enter a valid password';
                }
                return null;
              },
            ),
            const SizedBox(
              height: 20,
            ),
            CustomButton(
              onPressed: () {
                _loginUser();
              },
              textAlign: TextAlign.center,
              fontSize: 24,
              text: 'Login',
              height: 50,
              width: 260,
            ),
            const SizedBox(
              height: 20,
            ),
            const ForgotPassword(),
            const SizedBox(
              height: 10,
            ),
            SignUpSuggestion(
              onTap: () {
                Navigator.pushNamed(context, SignUpPage.id);
              },
            ),
          ],
        ),
      ),
    );
  }
}

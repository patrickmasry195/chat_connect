import 'package:chat_connect/regex_validator.dart';
import 'package:chat_connect/widgets/components/custom_background_form.dart';
import 'package:chat_connect/widgets/buttons/custom_button.dart';
import 'package:chat_connect/widgets/input_fields/custom_email_field.dart';
import 'package:chat_connect/widgets/input_fields/custom_password_field.dart';
import 'package:chat_connect/widgets/sign_up_suggestion.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({
    super.key,
  });

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final formKey = GlobalKey<FormState>();

  String? email, password;

  @override
  Widget build(BuildContext context) {
    return CustomBackGroundForm(
      height: 400,
      width: 350,
      child: Form(
        key: formKey,
        child: Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            CustomEmailField(
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
                if (formKey.currentState!.validate()) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Form is valid!')),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text('Please fix the errors in the form.')),
                  );
                }
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
            SignUpSuggestion(
              onTap: () {
                Navigator.pushNamed(context, 'SignUpPage');
              },
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:chat_connect/regex_validator.dart';
import 'package:chat_connect/widgets/components/custom_background_form.dart';
import 'package:chat_connect/widgets/buttons/custom_button.dart';
import 'package:chat_connect/widgets/input_fields/custom_confirm_password_field.dart';
import 'package:chat_connect/widgets/input_fields/custom_email_field.dart';
import 'package:chat_connect/widgets/input_fields/custom_name_field.dart';
import 'package:chat_connect/widgets/input_fields/custom_password_field.dart';
import 'package:flutter/material.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({
    super.key,
  });

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final formKey = GlobalKey<FormState>();
  String? name, email, password;

  @override
  Widget build(BuildContext context) {
    return CustomBackGroundForm(
      height: 420,
      width: 350,
      child: Form(
        key: formKey,
        child: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 10,
          ),
          children: [
            const SizedBox(
              height: 20,
            ),
            CustomNameField(
              nameValidator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your name';
                } else if (!nameRegex.hasMatch(value)) {
                  return 'Enter a valid name';
                }
                return null;
              },
            ),
            const SizedBox(
              height: 20,
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
                  return 'Please enter a password';
                } else if (!passwordRegex.hasMatch(value)) {
                  return 'Enter a valid password';
                }
                return null;
              },
            ),
            const SizedBox(
              height: 20,
            ),
            CustomConfirmPasswordField(
              confirmPasswordValidator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a password';
                } else if (value != password) {
                  return 'Password don\'t match';
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
              text: 'Create an account',
              fontSize: 24,
              height: 50,
              width: 260,
            )
          ],
        ),
      ),
    );
  }
}

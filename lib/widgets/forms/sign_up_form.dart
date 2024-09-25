import 'package:chat_connect/helpers/regex_validator.dart';
import 'package:chat_connect/models/user_model.dart';
import 'package:chat_connect/services/firebase_auth_services.dart';
import 'package:chat_connect/widgets/components/custom_background_form.dart';
import 'package:chat_connect/widgets/buttons/custom_button.dart';
import 'package:chat_connect/widgets/input_fields/custom_confirm_password_field.dart';
import 'package:chat_connect/widgets/input_fields/custom_email_field.dart';
import 'package:chat_connect/widgets/input_fields/custom_name_field.dart';
import 'package:chat_connect/widgets/input_fields/custom_password_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../helpers/show_snack_bar.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({
    super.key,
  });

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  String? _errorMessage;
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final AuthService _authService = AuthService();

  @override
  void dispose() {
    _userNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomBackGroundForm(
      height: 420,
      width: 350,
      child: Form(
        key: _formKey,
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
              nameController: _userNameController,
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
              emailController: _emailController,
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
              passwordController: _passwordController,
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
                } else if (value != _passwordController.text) {
                  return 'Passwords don\'t match';
                }
                return null;
              },
            ),
            const SizedBox(
              height: 20,
            ),
            CustomButton(
              onPressed: () {
                _register();
              },
              textAlign: TextAlign.center,
              text: 'Create an account',
              fontSize: 24,
              height: 50,
              width: 260,
            ),
          ],
        ),
      ),
    );
  }

  void _register() async {
    String email = _emailController.text.trim();
    String password = _passwordController.text.trim();
    String userName = _userNameController.text.trim();

    if (_formKey.currentState!.validate()) {
      UserModel newUser = UserModel(
        email: email,
        password: password,
        userName: userName,
      );

      User? user = await _authService.signUpWithEmailPassword(newUser);

      if (user != null) {
        Navigator.pushNamed(context, 'ChatsPage');
        showSnackBar(context, 'Registered successfully', Colors.green);
      } else {
        setState(() {
          _errorMessage = 'Registration failed. Please try again.';
        });
        showSnackBar(context, _errorMessage!, Colors.red);
      }
    } else {
      showSnackBar(context, 'Please fill in all required fields', Colors.red);
    }
  }
}

import 'package:chat_connect/helpers/regex_validator.dart';
import 'package:chat_connect/helpers/show_snack_bar.dart';
import 'package:chat_connect/services/firebase_auth_services.dart';
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
  final _formKey = GlobalKey<FormState>();
  String? _errorMessage;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final AuthService _authService = AuthService();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
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
                _login();
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

  void _login() async {
    String email = _emailController.text.trim();
    String password = _passwordController.text.trim();

    if (_formKey.currentState!.validate()) {
      String? error =
          await _authService.signInWithEmailPassword(email, password);

      if (error == null) {
        Navigator.pushNamed(context, 'ChatsPage');
        showSnackBar(context, 'Signed in successfully', Colors.green);
      } else {
        setState(() {
          _errorMessage = error;
        });
        showSnackBar(context, _errorMessage!, Colors.red);
      }
    } else {
      showSnackBar(context, 'Please fill the required fields', Colors.red);
    }
  }
}

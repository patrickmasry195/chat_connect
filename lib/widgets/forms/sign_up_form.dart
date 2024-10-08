import 'package:chat_connect/helpers/regex_validator.dart';
import 'package:chat_connect/pages/chats_page.dart';
import 'package:chat_connect/widgets/components/custom_background_form.dart';
import 'package:chat_connect/widgets/buttons/custom_button.dart';
import 'package:chat_connect/widgets/input_fields/custom_confirm_password_field.dart';
import 'package:chat_connect/widgets/input_fields/custom_email_field.dart';
import 'package:chat_connect/widgets/input_fields/custom_name_field.dart';
import 'package:chat_connect/widgets/input_fields/custom_password_field.dart';
import 'package:flutter/material.dart';
import '../../helpers/show_snack_bar.dart';
import '../../services/email_authentication.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({
    super.key,
  });

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isLoading = false;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
    super.dispose();
  }

  void _signUpUser() async {
    String res = await AuthService().signUpUser(
      email: emailController.text,
      password: passwordController.text,
      name: nameController.text,
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
      height: 500,
      width: 350,
      child: Form(
        key: _formKey,
        child: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 20,
          ),
          children: [
            const SizedBox(
              height: 20,
            ),
            CustomNameField(
              nameController: nameController,
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
                } else if (value != passwordController.text) {
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
                _signUpUser();
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
}

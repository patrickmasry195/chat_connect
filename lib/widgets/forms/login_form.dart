import 'package:chat_connect/widgets/layout/custom_background_form.dart';
import 'package:chat_connect/widgets/buttons/custom_button.dart';
import 'package:chat_connect/widgets/text_fields/custom_text_field.dart';
import 'package:chat_connect/widgets/common/sign_up_suggestion.dart';
import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomBackGroundForm(
      height: 400,
      width: 350,
      column: Column(
        children: [
          const SizedBox(
            height: 40,
          ),
          const CustomTextField(
            preIcon: Icons.email,
            hintText: 'Email',
            keyboardType: TextInputType.emailAddress,
          ),
          const SizedBox(
            height: 20,
          ),
          const CustomTextField(
            keyboardType: TextInputType.visiblePassword,
            preIcon: Symbols.password,
            hintText: 'Password',
            suffixIcon: Icons.remove_red_eye,
          ),
          const SizedBox(
            height: 20,
          ),
          CustomButton(
            onPressed: () {
              // Navigator.pushNamed(context, 'ChatsPage');
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
    );
  }
}

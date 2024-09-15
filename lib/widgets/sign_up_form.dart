import 'package:chat_connect/widgets/custom_background_form.dart';
import 'package:chat_connect/widgets/custom_button.dart';
import 'package:chat_connect/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomBackGroundForm(
      height: 420,
      width: 350,
      column: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          const CustomTextField(
            preIcon: Symbols.edit,
            hintText: 'Enter Your Name',
            keyboardType: TextInputType.text,
          ),
          const SizedBox(
            height: 20,
          ),
          const CustomTextField(
            preIcon: Icons.email,
            hintText: 'Enter Email',
            keyboardType: TextInputType.emailAddress,
          ),
          const SizedBox(
            height: 20,
          ),
          const CustomTextField(
            preIcon: Symbols.password,
            suffixIcon: Icons.remove_red_eye,
            hintText: 'Enter Password',
            keyboardType: TextInputType.visiblePassword,
          ),
          const SizedBox(
            height: 20,
          ),
          const CustomTextField(
            preIcon: Symbols.check,
            suffixIcon: Icons.remove_red_eye,
            hintText: 'Confirm Password',
            keyboardType: TextInputType.visiblePassword,
          ),
          const SizedBox(
            height: 20,
          ),
          CustomButton(
            onPressed: () {},
            textAlign: TextAlign.center,
            text: 'Create an account',
            fontSize: 24,
            height: 50,
            width: 260,
          )
        ],
      ),
    );
  }
}

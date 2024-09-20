import 'package:chat_connect/widgets/input_fields/custom_text_field.dart';
import 'package:flutter/material.dart';

class CustomEmailField extends StatelessWidget {
  const CustomEmailField({
    super.key,
    this.onChangedEmail,
    this.emailValidator,
  });

  final void Function(String)? onChangedEmail;
  final String? Function(String?)? emailValidator;

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      validator: emailValidator,
      preIcon: Icons.email,
      hintText: 'Enter Email',
      keyboardType: TextInputType.emailAddress,
    );
  }
}

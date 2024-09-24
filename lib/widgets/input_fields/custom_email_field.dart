import 'package:chat_connect/widgets/input_fields/custom_text_field.dart';
import 'package:flutter/material.dart';

class CustomEmailField extends StatelessWidget {
  const CustomEmailField({
    super.key,
    this.onChangedEmail,
    this.emailValidator,
    this.emailController,
  });

  final void Function(String)? onChangedEmail;
  final String? Function(String?)? emailValidator;
  final TextEditingController? emailController;

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      controller: emailController,
      validator: emailValidator,
      preIcon: Icons.email,
      hintText: 'Enter Email',
      keyboardType: TextInputType.emailAddress,
    );
  }
}

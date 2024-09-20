import 'package:chat_connect/widgets/input_fields/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';

class CustomConfirmPasswordField extends StatefulWidget {
  const CustomConfirmPasswordField({
    super.key,
    this.confirmPasswordValidator,
  });
  final String? Function(String?)? confirmPasswordValidator;
  @override
  State<CustomConfirmPasswordField> createState() =>
      _CustomConfirmPasswordFieldState();
}

class _CustomConfirmPasswordFieldState
    extends State<CustomConfirmPasswordField> {
  bool isObscured = true;

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      validator: widget.confirmPasswordValidator,
      obscureText: isObscured,
      preIcon: Symbols.check,
      suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              isObscured = !isObscured;
            });
          },
          icon: isObscured
              ? const Icon(Icons.visibility_off)
              : const Icon(Icons.visibility)),
      hintText: 'Confirm Password',
      keyboardType: TextInputType.visiblePassword,
    );
  }
}

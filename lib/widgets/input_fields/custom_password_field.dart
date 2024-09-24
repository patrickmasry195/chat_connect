import 'package:chat_connect/widgets/input_fields/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';

class CustomPasswordField extends StatefulWidget {
  const CustomPasswordField({
    super.key,
    this.passwordValidator,
    this.passwordController,
  });

  final String? Function(String?)? passwordValidator;
  final TextEditingController? passwordController;
  @override
  State<CustomPasswordField> createState() => _CustomPasswordFieldState();
}

class _CustomPasswordFieldState extends State<CustomPasswordField> {
  bool isObscured = true;

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      controller: widget.passwordController,
      validator: widget.passwordValidator,
      obscureText: isObscured,
      hintText: 'Enter Password',
      preIcon: Symbols.password,
      suffixIcon: IconButton(
        onPressed: () {
          setState(() {
            isObscured = !isObscured;
          });
        },
        icon: isObscured
            ? const Icon(Icons.visibility_off)
            : const Icon(Icons.visibility),
      ),
      keyboardType: TextInputType.visiblePassword,
    );
  }
}

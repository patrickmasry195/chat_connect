import 'package:chat_connect/widgets/input_fields/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';

class CustomNameField extends StatelessWidget {
  const CustomNameField({
    super.key,
    this.nameValidator,
  });
  final String? Function(String?)? nameValidator;
  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      validator: nameValidator,
      preIcon: Symbols.edit,
      hintText: 'Enter Your Name',
      keyboardType: TextInputType.text,
    );
  }
}

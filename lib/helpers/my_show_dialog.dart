import 'package:chat_connect/helpers/constants.dart';
import 'package:flutter/material.dart';
import '../widgets/input_fields/custom_text_field.dart';

Future<void> showAlertDialog(
    BuildContext context,
    Widget title,
    void Function()? onPressed,
    TextEditingController? controller,
    IconData? preIcon,
    String hintText,
    TextInputType keyboardType) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: title,
        content: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
          ),
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                height: 20,
              ),
              CustomTextField(
                controller: controller,
                preIcon: preIcon,
                hintText: hintText,
                keyboardType: keyboardType,
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text(
              'Cancel',
              style: TextStyle(color: Colors.red),
            ),
          ),
          TextButton(
            onPressed: onPressed,
            child: const Text(
              'Update',
              style: TextStyle(color: kSecondaryColor),
            ),
          ),
        ],
      );
    },
  );
}

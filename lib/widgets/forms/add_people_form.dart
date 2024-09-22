import 'package:chat_connect/helpers/regex_validator.dart';
import 'package:chat_connect/widgets/buttons/custom_button.dart';
import 'package:chat_connect/widgets/input_fields/custom_email_field.dart';
import 'package:flutter/material.dart';

class AddPeopleForm extends StatefulWidget {
  const AddPeopleForm({
    super.key,
  });

  @override
  State<AddPeopleForm> createState() => _AddPeopleFormState();
}

class _AddPeopleFormState extends State<AddPeopleForm> {
  final formKey = GlobalKey<FormState>();
  String? email;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.all(20.0),
        children: [
          CustomEmailField(
            emailValidator: (value) {
              if (value == null || value.isEmpty) {
                return 'Enter email to start chat';
              } else if (!emailRegex.hasMatch(value)) {
                return 'Enter a valid email address';
              }
              return null;
            },
          ),
          const SizedBox(
            height: 20,
          ),
          CustomButton(
            onPressed: () {
              if (formKey.currentState!.validate()) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Form is valid!')),
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                      content: Text('Please fix the errors in the form.')),
                );
              }
            },
            text: 'Start Chat',
            fontSize: 24,
            textAlign: TextAlign.center,
            height: 50,
            width: 268,
          ),
        ],
      ),
    );
  }
}

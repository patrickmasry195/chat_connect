import 'package:chat_connect/widgets/buttons/custom_button.dart';
import 'package:chat_connect/widgets/text_fields/custom_text_field.dart';
import 'package:flutter/material.dart';

class AddPeopleForm extends StatefulWidget {
  const AddPeopleForm({
    super.key,
  });

  @override
  State<AddPeopleForm> createState() => _AddPeopleFormState();
}

class _AddPeopleFormState extends State<AddPeopleForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.all(20.0),
        children: [
          const CustomTextField(
            preIcon: Icons.email,
            hintText: 'Enter Email',
            keyboardType: TextInputType.emailAddress,
          ),
          const SizedBox(
            height: 20,
          ),
          CustomButton(
            onPressed: () {},
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

import 'package:chat_connect/widgets/forms/add_people_form.dart';
import 'package:flutter/material.dart';

class AddPeople extends StatelessWidget {
  const AddPeople({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: 16,
          right: 16,
          bottom: MediaQuery.of(context).viewInsets.bottom),
      child: const Center(
        child: SingleChildScrollView(
          child: AddPeopleForm(),
        ),
      ),
    );
  }
}

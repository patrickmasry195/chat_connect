import 'package:chat_connect/helpers/constants.dart';
import 'package:chat_connect/widgets/forms/add_people_form.dart';
import 'package:flutter/material.dart';

class AddPeople extends StatelessWidget {
  const AddPeople({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      width: double.maxFinite,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        ),
        color: kSecondaryColor,
      ),
      child: Padding(
        padding: EdgeInsets.only(
            left: 16,
            right: 16,
            bottom: MediaQuery.of(context).viewInsets.bottom),
        child: const Center(
          child: AddPeopleForm(),
        ),
      ),
    );
  }
}

import 'package:chat_connect/helpers/regex_validator.dart';
import 'package:chat_connect/widgets/buttons/custom_button.dart';
import 'package:chat_connect/widgets/input_fields/custom_email_field.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../pages/chat_page.dart';

class AddPeopleForm extends StatefulWidget {
  const AddPeopleForm({super.key});

  @override
  State<AddPeopleForm> createState() => _AddPeopleFormState();
}

class _AddPeopleFormState extends State<AddPeopleForm> {
  final formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  String? _errorMessage;

  void _addPerson() async {
    final email = _emailController.text.trim();

    if (email.isEmpty) {
      setState(() {
        _errorMessage = "Please enter an email.";
      });
      return;
    }

    final currentUser = FirebaseAuth.instance.currentUser;

    final usersSnapshot = await FirebaseFirestore.instance
        .collection('users')
        .where('email', isEqualTo: email)
        .get();

    if (usersSnapshot.docs.isNotEmpty) {
      final user = usersSnapshot.docs.first;

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ChatPage(
            userId: currentUser!.uid,
            peerId: user.id,
            userName: user['name'],
            profilePicUrl: user['profileImageUrl'],
          ),
        ),
      );
    } else {
      setState(() {
        _errorMessage = "No user found with that email.";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.all(20.0),
        children: [
          CustomEmailField(
            emailController: _emailController,
            emailValidator: (value) {
              if (value == null || value.isEmpty) {
                return 'Enter email to start chat';
              } else if (!emailRegex.hasMatch(value)) {
                return 'Enter a valid email address';
              }
              return null;
            },
          ),
          const SizedBox(height: 20),
          if (_errorMessage != null)
            Text(
              _errorMessage!,
              style: const TextStyle(color: Colors.red),
            ),
          CustomButton(
            onPressed: () {
              if (formKey.currentState!.validate()) {
                _addPerson();
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Please fix the errors in the form.'),
                  ),
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

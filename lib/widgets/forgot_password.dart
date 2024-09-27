import 'package:chat_connect/helpers/constants.dart';
import 'package:chat_connect/helpers/show_snack_bar.dart';
import 'package:chat_connect/widgets/buttons/custom_button.dart';
import 'package:chat_connect/widgets/input_fields/custom_text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/app_theme_bloc.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController emailController = TextEditingController();
  final auth = FirebaseAuth.instance;
  bool isDarkMode = false;

  @override
  void initState() {
    isDarkMode = BlocProvider.of<AppThemeBloc>(context).state is AppDarkTheme;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 35),
      child: Align(
        alignment: Alignment.center,
        child: InkWell(
          onTap: () {
            myDialogBox(context);
          },
          child: const Text(
            'Forgot password ?',
            style: TextStyle(
              fontSize: 17,
              color: kPrimaryColor,
            ),
          ),
        ),
      ),
    );
  }

  void myDialogBox(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Container(
            decoration: BoxDecoration(
              color: isDarkMode ? Colors.orange : kThirdColor,
              borderRadius: BorderRadius.circular(20),
            ),
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  leading: const Text(
                    'Forgot your password',
                    style: TextStyle(
                      fontSize: 18,
                      color: kSecondaryColor,
                    ),
                  ),
                  trailing: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.close,
                      color: kSecondaryColor,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextField(
                  controller: emailController,
                  preIcon: Icons.email,
                  hintText: 'Enter Email',
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomButton(
                  onPressed: () async {
                    await auth
                        .sendPasswordResetEmail(email: emailController.text)
                        .then((value) {
                      showSnackBar(
                          context,
                          'We have send you the reset password link to your email, Please check it',
                          Colors.green);
                    }).onError((error, stackTrace) {
                      showSnackBar(context, error.toString(), Colors.red);
                    });
                    Navigator.pop(context);
                    emailController.clear();
                  },
                  text: 'Send',
                  fontSize: 18,
                  height: 50,
                  width: 260,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

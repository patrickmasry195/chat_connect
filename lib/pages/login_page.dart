import 'package:chat_connect/constants.dart';
import 'package:chat_connect/widgets/custom_app_bar.dart';
import 'package:chat_connect/widgets/custom_background_form.dart';
import 'package:chat_connect/widgets/custom_button.dart';
import 'package:chat_connect/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        icon: Icons.arrow_back,
        text: 'Login to ChatConnect',
        onPressed: () {
          Navigator.pushNamed(context, 'GetStartedPage');
        },
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 18),
            child: Center(
              child: CustomBackGroundForm(
                column: Column(
                  children: [
                    const Spacer(
                      flex: 2,
                    ),
                    const CustomTextField(
                      preIcon: Icons.email,
                      hintText: 'Email',
                      keyboardType: TextInputType.emailAddress,
                    ),
                    const Spacer(
                      flex: 1,
                    ),
                    const CustomTextField(
                      keyboardType: TextInputType.visiblePassword,
                      preIcon: Icons.lock,
                      hintText: 'Password',
                      suffixIcon: Icons.remove_red_eye,
                    ),
                    const Spacer(
                      flex: 1,
                    ),
                    CustomButton(
                      onPressed: () {},
                      textAlign: TextAlign.center,
                      fontSize: 24,
                      text: 'Login',
                      height: 50,
                      width: 260,
                      buttonColor: kPrimaryColor,
                      textColor: kSecondaryColor,
                    ),
                    const Spacer(
                      flex: 2,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Don\'t have account?',
                          style: GoogleFonts.jockeyOne(
                            color: Colors.white,
                            fontSize: 21,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Text(
                            ' Sign up',
                            style: GoogleFonts.jockeyOne(
                              color: kPrimaryColor,
                              fontSize: 21,
                            ),
                          ),
                        )
                      ],
                    ),
                    const Spacer(
                      flex: 2,
                    ),
                  ],
                ),
                height: 400,
                width: 350,
              ),
            ),
          ),
          Text(
            'OR',
            style: GoogleFonts.jockeyOne(
              color: kSecondaryColor,
              fontSize: 21,
            ),
          ),
          const Spacer(
            flex: 1,
          ),
          CustomButton(
            onPressed: () {},
            fontSize: 24,
            buttonColor: kPrimaryColor,
            textColor: kSecondaryColor,
            iconPath: 'assets/google.png',
            text: 'Continue with Google',
            height: 50,
            width: 320,
          ),
          const Spacer(
            flex: 1,
          ),
          CustomButton(
            onPressed: () {},
            fontSize: 24,
            buttonColor: kPrimaryColor,
            textColor: kSecondaryColor,
            iconPath: 'assets/facebook.png',
            text: 'Continue with Facebook',
            height: 50,
            width: 320,
          ),
          const Spacer(
            flex: 5,
          ),
        ],
      ),
    );
  }
}

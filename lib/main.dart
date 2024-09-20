import 'package:chat_connect/constants.dart';
import 'package:chat_connect/pages/chat_page.dart';
import 'package:chat_connect/pages/chats_page.dart';
import 'package:chat_connect/pages/get_started_page.dart';
import 'package:chat_connect/pages/login_page.dart';
import 'package:chat_connect/pages/sign_up_page.dart';
import 'package:chat_connect/pages/settings_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const ChatConnect());
}

class ChatConnect extends StatelessWidget {
  const ChatConnect({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: GoogleFonts.jockeyOne().fontFamily,
        appBarTheme: const AppBarTheme(
          backgroundColor: kPrimaryColor,
        ),
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: 'GetStartedPage',
      routes: {
        'GetStartedPage': (context) => const GetStartedPage(),
        'LoginPage': (context) => const LoginPage(),
        'SignUpPage': (context) => const SignUpPage(),
        'ChatsPage': (context) => const ChatsPage(),
        'SettingsPage': (context) => const SettingsPage(),
        'ChatPage': (context) => const ChatPage(),
      },
    );
  }
}

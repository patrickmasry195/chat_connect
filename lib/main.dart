import 'package:chat_connect/pages/get_started_page.dart';
import 'package:chat_connect/pages/login_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const ChatConnect());
}

class ChatConnect extends StatelessWidget {
  const ChatConnect({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'GetStartedPage',
      routes: {
        'GetStartedPage': (context) => const GetStartedPage(),
        'LoginPage': (context) => const LoginPage(),
      },
    );
  }
}

import 'package:chat_connect/bloc/app_theme_bloc.dart';
import 'package:chat_connect/pages/chat_page.dart';
import 'package:chat_connect/pages/chats_page.dart';
import 'package:chat_connect/pages/get_started_page.dart';
import 'package:chat_connect/pages/login_page.dart';
import 'package:chat_connect/pages/sign_up_page.dart';
import 'package:chat_connect/pages/settings_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const ChatConnect());
}

class ChatConnect extends StatelessWidget {
  const ChatConnect({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppThemeBloc()..add(InitialEvent()),
      child: BlocBuilder<AppThemeBloc, AppThemeState>(
        builder: (context, state) {
          ThemeData theme;
          if (state is AppLightTheme) {
            theme = state.lightTheme;
          } else if (state is AppDarkTheme) {
            theme = state.darkTheme;
          } else {
            theme = ThemeData.light();
          }
          return MaterialApp(
            theme: theme,
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
        },
      ),
    );
  }
}

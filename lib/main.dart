import 'package:chat_connect/bloc/app_theme_bloc.dart';
import 'package:chat_connect/firebase_options.dart';
import 'package:chat_connect/pages/chat_page.dart';
import 'package:chat_connect/pages/chats_page.dart';
import 'package:chat_connect/pages/get_started_page.dart';
import 'package:chat_connect/pages/login_page.dart';
import 'package:chat_connect/pages/sign_up_page.dart';
import 'package:chat_connect/pages/settings_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
            home: StreamBuilder(
              stream: FirebaseAuth.instance.authStateChanges(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return const ChatsPage();
                } else {
                  return const GetStartedPage();
                }
              },
            ),
            routes: {
              GetStartedPage.id: (context) => const GetStartedPage(),
              LoginPage.id: (context) => const LoginPage(),
              SignUpPage.id: (context) => const SignUpPage(),
              ChatsPage.id: (context) => const ChatsPage(),
              SettingsPage.id: (context) => const SettingsPage(),
              ChatPage.id: (context) => const ChatPage(),
            },
          );
        },
      ),
    );
  }
}

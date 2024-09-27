import 'package:chat_connect/bloc/app_theme_bloc.dart';
import 'package:chat_connect/helpers/constants.dart';
import 'package:chat_connect/services/authentication.dart';
import 'package:chat_connect/widgets/buttons/custom_button.dart';
import 'package:chat_connect/widgets/custom_user_email.dart';
import 'package:chat_connect/widgets/custom_user_name.dart';
import 'package:chat_connect/widgets/list_views/drawer_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'get_started_page.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  static String id = 'SettingsPage';

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool isDarkMode = false;

  @override
  void initState() {
    isDarkMode = BlocProvider.of<AppThemeBloc>(context).state is AppDarkTheme;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (context) {
            return IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: const Icon(
                Icons.menu,
                color: kSecondaryColor,
              ),
            );
          },
        ),
        title: const Text(
          'Settings',
          style: TextStyle(
            color: kSecondaryColor,
          ),
        ),
      ),
      drawer: const Drawer(
        child: DrawerListView(),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundImage: const AssetImage('assets/avatar.jpg'),
              maxRadius: 40,
              child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.edit,
                  color: Colors.white,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(width: 35),
                const CustomUserName(
                  name: 'No Name',
                  fontSize: 40,
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.edit,
                    color: kSecondaryColor,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                const SizedBox(width: 95),
                const CustomUserEmail(
                  email: 'No email',
                  fontSize: 20,
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.edit,
                    color: kSecondaryColor,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            ListTile(
              onTap: () {
                setState(() {
                  isDarkMode = !isDarkMode;
                  if (isDarkMode) {
                    BlocProvider.of<AppThemeBloc>(context).add(DarkEvent());
                  } else {
                    BlocProvider.of<AppThemeBloc>(context).add(LightEvent());
                  }
                });
              },
              leading: Icon(
                isDarkMode ? Icons.light_mode : Icons.dark_mode,
                size: 40,
                color: kSecondaryColor,
              ),
              title: Text(
                isDarkMode ? 'Light mode' : 'Dark mode',
                style: const TextStyle(
                  color: kSecondaryColor,
                  fontSize: 30,
                ),
              ),
            ),
            ListTile(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text(
                        "Delete your Account",
                        style: TextStyle(color: Colors.red),
                      ),
                      content: const Text(
                        kWarningMessage,
                        style: TextStyle(fontSize: 18),
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text(
                            "Cancel",
                            style: TextStyle(
                              color: kSecondaryColor,
                              fontSize: 18,
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            "Delete",
                            style: TextStyle(color: Colors.red, fontSize: 18),
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
              leading: const Icon(
                Icons.delete,
                size: 40,
                color: Colors.red,
              ),
              title: const Text(
                'Delete account',
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 30,
                ),
              ),
            ),
            const SizedBox(height: 180),
            CustomButton(
              onPressed: () async {
                await AuthService().signOut();
                Navigator.pushNamed(context, GetStartedPage.id);
              },
              text: 'Logout',
              fontSize: 25,
              height: 50,
              width: 150,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

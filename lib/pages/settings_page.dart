import 'package:chat_connect/bloc/app_theme_bloc.dart';
import 'package:chat_connect/helpers/constants.dart';
import 'package:chat_connect/widgets/buttons/custom_button.dart';
import 'package:chat_connect/widgets/custom_user_email.dart';
import 'package:chat_connect/widgets/custom_user_name.dart';
import 'package:chat_connect/widgets/list_views/drawer_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

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
        padding: const EdgeInsets.symmetric(
          vertical: 40,
        ),
        child: Column(
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
                const CustomUserName(name: 'Maxwell Thorne', fontSize: 40),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.edit,
                      color: kSecondaryColor,
                    )),
              ],
            ),
            Row(
              children: [
                const SizedBox(width: 120),
                const CustomUserEmail(email: 'maxwell@gmail.com', fontSize: 20),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.edit,
                      color: kSecondaryColor,
                    )),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
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
              onTap: () {},
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
            const SizedBox(
              height: 180,
            ),
            CustomButton(
              onPressed: () {
                Navigator.pushNamed(context, 'GetStartedPage');
              },
              text: 'Logout',
              fontSize: 25,
              height: 50,
              width: 150,
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}

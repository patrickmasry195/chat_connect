import 'package:chat_connect/constants.dart';
import 'package:chat_connect/widgets/custom_user_email.dart';
import 'package:chat_connect/widgets/custom_user_name.dart';
import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';

class DrawerListView extends StatefulWidget {
  const DrawerListView({super.key});

  @override
  State<DrawerListView> createState() => _DrawerListViewState();
}

class _DrawerListViewState extends State<DrawerListView> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const DrawerHeader(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                backgroundImage: AssetImage('assets/avatar.jpg'),
                maxRadius: 30,
              ),
              SizedBox(
                height: 10,
              ),
              CustomUserName(name: 'Maxwell Thorne', fontSize: 20),
              CustomUserEmail(email: 'maxwell@gmail.com', fontSize: 15),
            ],
          ),
        ),
        ListTile(
          leading: const Icon(
            Symbols.forum,
            color: kSecondaryColor,
            size: 35,
          ),
          title: const Text(
            'Chats',
            style: TextStyle(
              color: kSecondaryColor,
              fontSize: 25,
            ),
          ),
          onTap: () {
            setState(() {
              Navigator.pushNamed(context, 'ChatsPage');
            });
          },
        ),
        ListTile(
          leading: const Icon(
            Symbols.settings,
            color: kSecondaryColor,
            size: 35,
          ),
          title: const Text(
            'Settings & Account',
            style: TextStyle(
              color: kSecondaryColor,
              fontSize: 25,
            ),
          ),
          onTap: () {
            setState(() {
              Navigator.pushNamed(context, 'SettingsPage');
            });
          },
        ),
      ],
    );
  }
}

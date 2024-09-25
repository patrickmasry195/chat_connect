import 'package:chat_connect/helpers/constants.dart';
import 'package:chat_connect/widgets/custom_user_email.dart';
import 'package:chat_connect/widgets/custom_user_name.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';

class DrawerListView extends StatefulWidget {
  const DrawerListView({super.key});

  @override
  State<DrawerListView> createState() => _DrawerListViewState();
}

class _DrawerListViewState extends State<DrawerListView> {
  final db = FirebaseFirestore.instance;
  final user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        DrawerHeader(
          child: StreamBuilder(
              stream: db.collection("users").doc(user!.uid).snapshots(),
              builder: (context, snapshot) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CircleAvatar(
                      backgroundImage: AssetImage('assets/avatar.jpg'),
                      maxRadius: 30,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomUserName(
                      name: snapshot.data!['UserName'],
                      fontSize: 20,
                    ),
                    CustomUserEmail(
                      email: snapshot.data!['Email'],
                      fontSize: 15,
                    ),
                  ],
                );
              }),
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

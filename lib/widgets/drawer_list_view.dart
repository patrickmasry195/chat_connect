import 'package:chat_connect/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
        DrawerHeader(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CircleAvatar(
                backgroundImage: AssetImage('assets/avatar.jpg'),
                maxRadius: 30,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Maxwell Thorne',
                style: GoogleFonts.jockeyOne(
                  color: kSecondaryColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'maxwell@gmail.com',
                style: GoogleFonts.jockeyOne(
                  color: kFourthColor,
                  fontSize: 15,
                ),
              ),
            ],
          ),
        ),
        ListTile(
          leading: const Icon(
            Symbols.forum,
            color: kSecondaryColor,
            size: 35,
          ),
          title: Text(
            'Chats',
            style: GoogleFonts.jockeyOne(
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
          title: Text(
            'Settings & Account',
            style: GoogleFonts.jockeyOne(
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

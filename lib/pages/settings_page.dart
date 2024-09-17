import 'package:chat_connect/constants.dart';
import 'package:chat_connect/widgets/drawer_list_view.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: kSecondaryColor),
        backgroundColor: kPrimaryColor,
        title: Text(
          'Settings',
          style: GoogleFonts.jockeyOne(
            color: kSecondaryColor,
          ),
        ),
      ),
      drawer: const Drawer(
        child: DrawerListView(),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40,),
        child: Column(
          children: [
            const CircleAvatar(
              backgroundImage: AssetImage('assets/avatar.jpg'),
              maxRadius: 40,
            ),
            Text(
              'Maxwell Thorne',
              style: GoogleFonts.jockeyOne(
                color: kSecondaryColor,
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'maxwell@gmail.com',
              style: GoogleFonts.jockeyOne(
                color: kFourthColor,
                fontSize: 20,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            ListTile(
              onTap: () {},
              leading: const Icon(
                Icons.dark_mode,
                size: 40,
                color: kSecondaryColor,
              ),
              title: Text(
                'Dark mode',
                style: GoogleFonts.jockeyOne(
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
              title: Text(
                'Delete account',
                style: GoogleFonts.jockeyOne(
                  color: Colors.red,
                  fontSize: 30,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

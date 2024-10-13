import 'package:chat_connect/helpers/constants.dart';
import 'package:chat_connect/widgets/add_people.dart';
import 'package:chat_connect/widgets/list_views/drawer_list_view.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  static String id = 'ChatsPage';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final currentUser = FirebaseAuth.instance.currentUser;

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
          'Home Page',
          style: TextStyle(
            color: kSecondaryColor,
          ),
        ),
      ),
      drawer: const Drawer(
        child: DrawerListView(),
      ),
      body: Center(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: kPrimaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: const Text(
            'Connect with someone',
            style: TextStyle(
              color: kSecondaryColor,
              fontSize: 20,
            ),
          ),
          onPressed: () {
            showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              builder: (context) => Container(
                color: kSecondaryColor,
                padding: const EdgeInsets.all(16),
                child: const Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AddPeople(),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

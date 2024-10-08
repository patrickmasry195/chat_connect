import 'package:chat_connect/helpers/constants.dart';
import 'package:chat_connect/widgets/custom_user_email.dart';
import 'package:chat_connect/widgets/custom_user_name.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';

import '../../services/fetch_user_data.dart';

class DrawerListView extends StatefulWidget {
  const DrawerListView({super.key});

  @override
  State<DrawerListView> createState() => _DrawerListViewState();
}

class _DrawerListViewState extends State<DrawerListView> {
  late FetchUserData fetchUserData;

  @override
  void initState() {
    fetchUserData = FetchUserData();
    super.initState();
  }

  Future<Map<String, dynamic>> fetchUserDataFromBothSources() async {
    await fetchUserData.displayUserData();
    User? user = FirebaseAuth.instance.currentUser;
    String? email = user?.email;
    String? name = user?.displayName;

    Map<String, dynamic>? firestoreData =
        await fetchUserData.getUserDataFromFirestore();

    if (name == null &&
        firestoreData != null &&
        firestoreData.containsKey('name')) {
      name = firestoreData['name'];
    }

    return {
      'name': name ?? 'No Name',
      'email': email ?? 'No Email',
      'photoURL': user?.photoURL ?? null,
    };
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: fetchUserDataFromBothSources(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(
                color: kSecondaryColor,
              ),
            );
          } else if (snapshot.hasError) {
            return const Center(
              child: Text('Error loading user data'),
            );
          } else if (!snapshot.hasData || snapshot.data == null) {
            return const Center(
              child: Text('No user data available'),
            );
          } else {
            Map<String, dynamic> userData = snapshot.data!;
            String name = userData['name'];
            String email = userData['email'];
            String? photoURL = userData['photoURL'];

            return ListView(
              children: [
                DrawerHeader(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        backgroundImage: photoURL != null
                            ? NetworkImage(photoURL)
                            : const AssetImage("assets/def_avatar.png")
                                as ImageProvider,
                        maxRadius: 30,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomUserName(
                        name: name,
                        fontSize: 20,
                      ),
                      CustomUserEmail(
                        email: email,
                        fontSize: 15,
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
        });
  }
}

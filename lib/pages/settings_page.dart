import 'package:chat_connect/bloc/app_theme_bloc.dart';
import 'package:chat_connect/helpers/constants.dart';
import 'package:chat_connect/widgets/buttons/custom_button.dart';
import 'package:chat_connect/widgets/custom_user_email.dart';
import 'package:chat_connect/widgets/custom_user_name.dart';
import 'package:chat_connect/widgets/list_views/drawer_list_view.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool isDarkMode = false;
  final db = FirebaseFirestore.instance;
  final user = FirebaseAuth.instance.currentUser;

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
        child: StreamBuilder(
            stream: db.collection("users").doc(user!.uid).snapshots(),
            builder: (context, snapshot) {
              return Column(
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
                      CustomUserName(
                        name: snapshot.data!['UserName'],
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
                      CustomUserEmail(
                          email: snapshot.data!['Email'], fontSize: 20),
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
                          BlocProvider.of<AppThemeBloc>(context)
                              .add(DarkEvent());
                        } else {
                          BlocProvider.of<AppThemeBloc>(context)
                              .add(LightEvent());
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
                                '''If you select Delete we will delete your account on our server.\nYour chats will also be deleted and you won't be able to retrieve it.''',
                                style: TextStyle(
                                  fontSize: 18,
                                ),
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
                                    )),
                                TextButton(
                                  onPressed: () {
                                    FirebaseAuth.instance.currentUser!.delete();
                                    Navigator.pushNamed(
                                        context, 'GetStartedPage');
                                  },
                                  child: const Text(
                                    "Delete",
                                    style: TextStyle(
                                        color: Colors.red, fontSize: 18),
                                  ),
                                ),
                              ],
                            );
                          });
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
                  const SizedBox(
                    height: 180,
                  ),
                  CustomButton(
                    onPressed: () {
                      FirebaseAuth.instance.signOut();
                      Navigator.pushNamed(context, 'LoginPage');
                    },
                    text: 'Logout',
                    fontSize: 25,
                    height: 50,
                    width: 150,
                    textAlign: TextAlign.center,
                  )
                ],
              );
            }),
      ),
    );
  }
}

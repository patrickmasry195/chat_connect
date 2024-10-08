import 'package:chat_connect/bloc/app_theme_bloc.dart';
import 'package:chat_connect/helpers/constants.dart';
import 'package:chat_connect/helpers/my_show_dialog.dart';
import 'package:chat_connect/services/email_authentication.dart';
import 'package:chat_connect/widgets/buttons/custom_button.dart';
import 'package:chat_connect/widgets/list_views/drawer_list_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../services/fetch_user_data.dart';
import '../services/update_user.dart';
import 'get_started_page.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  static String id = 'SettingsPage';

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool isDarkMode = false;
  late FetchUserData fetchUserData;
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  final UpdateUser _updateUser = UpdateUser();

  @override
  void initState() {
    isDarkMode = BlocProvider.of<AppThemeBloc>(context).state is AppDarkTheme;
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
      body: FutureBuilder(
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

            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 60),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      backgroundImage: photoURL != null
                          ? NetworkImage(photoURL)
                          : const AssetImage("assets/def_avatar.png")
                              as ImageProvider,
                      maxRadius: 40,
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.edit,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    TextButton(
                      onPressed: () {
                        showAlertDialog(
                          context,
                          const Text(
                            'Update Name',
                            style: TextStyle(color: kSecondaryColor),
                          ),
                          () async {
                            String userId =
                                FirebaseAuth.instance.currentUser!.uid;
                            String newName = nameController.text.trim();
                            if (newName.isNotEmpty) {
                              await _updateUser.updateUserName(userId, newName);
                              setState(() {
                                name = newName;
                              });
                              Navigator.of(context).pop();
                            }
                          },
                          nameController,
                          Icons.drive_file_rename_outline_rounded,
                          'Enter new name',
                          TextInputType.text,
                        );
                      },
                      child: Text(
                        name,
                        style: const TextStyle(
                          color: kSecondaryColor,
                          fontSize: 28,
                        ),
                      ),
                    ),
                    Text(
                      email,
                      style: const TextStyle(
                        color: kSecondaryColor,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(height: 30),
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
                                    style: TextStyle(
                                        color: Colors.red, fontSize: 18),
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
        },
      ),
    );
  }
}

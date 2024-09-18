import 'package:chat_connect/constants.dart';
import 'package:chat_connect/widgets/add_people.dart';
import 'package:chat_connect/widgets/custom_app_bar.dart';
import 'package:chat_connect/widgets/drawer_list_view.dart';
import 'package:chat_connect/widgets/chat_tile_list_view.dart';
import 'package:flutter/material.dart';

class ChatsPage extends StatefulWidget {
  const ChatsPage({super.key});

  @override
  State<ChatsPage> createState() => _ChatsPageState();
}

class _ChatsPageState extends State<ChatsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Chats',
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
      ),
      drawer: const Drawer(
        child: DrawerListView(),
      ),
      body:  ChatTileListView(
 
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            builder: (context) {
              return const AddPeople();
            },
          );
        },
        shape: const CircleBorder(),
        backgroundColor: kPrimaryColor,
        child: const Icon(
          Icons.person_add,
          color: kSecondaryColor,
        ),
      ),
    );
  }
}

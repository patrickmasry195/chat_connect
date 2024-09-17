import 'package:chat_connect/constants.dart';
import 'package:chat_connect/widgets/common/add_people.dart';
import 'package:chat_connect/widgets/tiles/chat_tile_list_view.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChatsPage extends StatefulWidget {
  const ChatsPage({super.key});

  @override
  State<ChatsPage> createState() => _ChatsPageState();
}

class _ChatsPageState extends State<ChatsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: kSecondaryColor),
        backgroundColor: kPrimaryColor,
        title: Text(
          'Chats',
          style: GoogleFonts.jockeyOne(
            color: kSecondaryColor,
          ),
        ),
      ),
      drawer: const Drawer(),
      body: const ChatTileListView(),
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


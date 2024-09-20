import 'package:chat_connect/widgets/components/chat_tile.dart';
import 'package:flutter/material.dart';

class ChatTileListView extends StatefulWidget {
  const ChatTileListView({super.key});

  @override
  State<ChatTileListView> createState() => _ChatTileListViewState();
}

class _ChatTileListViewState extends State<ChatTileListView> {
  List<int> items = List<int>.generate(10, (int index) => index);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Dismissible(
            direction: DismissDirection.endToStart,
            background: Container(
              height: 90,
              width: 500,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.red,
              ),
              child: const Icon(
                Icons.delete,
                size: 40,
              ),
            ),
            key: ValueKey<int>(items[index]),
            onDismissed: (DismissDirection direction) {
              setState(() {
                items.removeAt(index);
              });
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: ChatTile(
                onTap: () {
                  Navigator.pushNamed(context, 'ChatPage');
                },
              ),
            ),
          );
        },
      ),
    );
  }
}

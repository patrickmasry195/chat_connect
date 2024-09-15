import 'package:chat_connect/widgets/chat_tile.dart';
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
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return Dismissible(
          direction: DismissDirection.endToStart,
          background: Container(
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
          child: const Padding(
            padding: EdgeInsets.symmetric(vertical: 5),
            child: ChatTile(),
          ),
        );
      },
    );
  }
}

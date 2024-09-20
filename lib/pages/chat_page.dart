import 'package:chat_connect/constants.dart';
import 'package:chat_connect/widgets/conversation_bubbles/chat_bubble.dart';
import 'package:chat_connect/widgets/conversation_bubbles/chat_bubble_for_friend.dart';
import 'package:chat_connect/widgets/input_fields/chat_input_field.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pushNamed(context, 'ChatsPage');
          },
          icon: const Icon(
            Icons.arrow_back,
            color: kSecondaryColor,
          ),
        ),
        title: const Row(
          children: [
            CircleAvatar(backgroundImage: AssetImage('assets/avatar.jpg')),
            SizedBox(
              width: 20,
            ),
            Text(
              'Maxwell Thorne',
              style: TextStyle(
                color: kSecondaryColor,
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: const [
                ChatBubble(),
                ChatBubbleForFriend(),
                ChatBubble(),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 25, vertical: 30),
            child: ChatInputField(),
          ),
        ],
      ),
    );
  }
}

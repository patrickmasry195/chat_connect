import 'package:chat_connect/helpers/constants.dart';
import 'package:chat_connect/widgets/conversation_bubbles/received_chat_bubble.dart';
import 'package:chat_connect/widgets/conversation_bubbles/sent_chat_bubble.dart';
import 'package:chat_connect/widgets/input_fields/chat_input_field.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({
    super.key,
    this.userId,
    this.peerId,
    this.userName,
    this.profilePicUrl,
  });

  static String id = 'ChatPage';

  final String? userId;
  final String? peerId;
  final String? userName;
  final String? profilePicUrl;

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final _controller = TextEditingController();
  final _firestore = FirebaseFirestore.instance;

  void _sendMessage() {
    if (_controller.text.isNotEmpty) {
      _firestore.collection('messages').add({
        'senderId': widget.userId,
        'receiverId': widget.peerId,
        'text': _controller.text,
        'timeStamp': FieldValue.serverTimestamp(),
      });
      _controller.clear();
    }
  }

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
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(widget.profilePicUrl!),
            ),
            const SizedBox(width: 20),
            Text(
              widget.userName!,
              style: const TextStyle(color: kSecondaryColor),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: _firestore
                  .collection('messages')
                  .orderBy('timeStamp', descending: true)
                  .snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                final messages = snapshot.data!.docs.where((message) {
                  return (message['senderId'] == widget.userId &&
                          message['receiverId'] == widget.peerId) ||
                      (message['senderId'] == widget.peerId &&
                          message['receiverId'] == widget.userId);
                }).toList();

                return ListView.builder(
                  reverse: true,
                  itemCount: messages.length,
                  itemBuilder: (context, index) {
                    final message = messages[index];
                    final isSentBy = message['senderId'] == widget.userId;

                    return isSentBy
                        ? SentChatBubble(message: message['text'])
                        : ReceivedChatBubble(message: message['text']);
                  },
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
            child: ChatInputField(
              controller: _controller,
              onPressed: _sendMessage,
            ),
          ),
        ],
      ),
    );
  }
}

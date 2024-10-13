import 'package:chat_connect/bloc/app_theme_bloc.dart';
import 'package:chat_connect/helpers/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatTile extends StatefulWidget {
  const ChatTile({
    super.key,
    required this.onTap,
    required this.peerName,
    required this.lastMessage,
    required this.lastMessageTime,
  });

  final void Function()? onTap;
  final String peerName;
  final String lastMessage;
  final String lastMessageTime;

  @override
  State<ChatTile> createState() => _ChatTileState();
}

class _ChatTileState extends State<ChatTile> {
  bool isDarkMode = false;

  @override
  void initState() {
    isDarkMode = BlocProvider.of<AppThemeBloc>(context).state is AppDarkTheme;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        height: 90,
        width: 500,
        padding: const EdgeInsets.symmetric(horizontal: 15),
        decoration: BoxDecoration(
          color: isDarkMode ? kChatTileDarkModeColor : kThirdColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            const CircleAvatar(
              maxRadius: 30,
              backgroundImage: AssetImage(
                'assets/avatar.jpg',
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.peerName,
                    style: const TextStyle(
                      color: kSecondaryColor,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    width: 200,
                    child: Text(
                      widget.lastMessage,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: kHintColor,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40, left: 15),
              child: Text(
                widget.lastMessageTime,
                style: const TextStyle(
                  color: kSecondaryColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

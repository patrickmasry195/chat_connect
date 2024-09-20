import 'package:chat_connect/constants.dart';
import 'package:flutter/material.dart';

class ChatTile extends StatelessWidget {
  const ChatTile({
    super.key,
    required this.onTap,
  });

  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 90,
        width: 500,
        padding: const EdgeInsets.symmetric(horizontal: 15),
        decoration: BoxDecoration(
          color: kThirdColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: const Row(
          children: [
            CircleAvatar(
              maxRadius: 30,
              backgroundImage: AssetImage(
                'assets/avatar.jpg',
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Maxwell Throne',
                    style: TextStyle(
                      color: kSecondaryColor,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    width: 200,
                    child: Text(
                      'Let\'s grab lunch tomorrow! I\'ve missed our chats.hbvfbhbvhfvbdbvdvbdhkj',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: kHintColor,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 40, left: 15),
              child: Text(
                '12:10pm',
                style: TextStyle(
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

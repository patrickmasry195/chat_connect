import 'package:chat_connect/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChatTile extends StatelessWidget {
  const ChatTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      height: 90,
      width: 500,
      decoration: BoxDecoration(
        color: kThirdColor,
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
          const SizedBox(
            width: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Maxwell Throne',
                  style: GoogleFonts.jockeyOne(
                      color: kSecondaryColor,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 200,
                  child: Text(
                    'Let\'s grab lunch tomorrow! I\'ve missed our chats.hbvfbhbvhfvbdbvdvbdhkj',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.jockeyOne(
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
              '12:10pm',
              style: GoogleFonts.jockeyOne(
                color: kSecondaryColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

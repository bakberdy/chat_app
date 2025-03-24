import 'package:chat_app/domain/entities/chat_entity.dart';
import 'package:flutter/material.dart';

class ChatList extends StatelessWidget {
  const ChatList({
    super.key,
    required this.chats,
    required this.onTap,
    this.onAddToFriend,
  });

  final List<ChatEntity> chats;
  final Function(String uuid) onTap;
  final Function(String uuid)? onAddToFriend;

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return ListView.builder(
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: chats.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        final chat = chats[index];
        return Container(
          alignment: Alignment.center,
          constraints: BoxConstraints(minHeight: 75),
          decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(
                      width: 1, color: themeData.hintColor.withAlpha(30)))),
          child: Material(
            color: Colors.white,
            child: ListTile(
              onTap: () {
                //onTap(message.uuid);
              },
              contentPadding: const EdgeInsets.symmetric(horizontal: 28),
              leading: ClipOval(
                child: Image.network(
                  chat.sender.userAvatar,
                  height: 50,
                  width: 50,
                  fit: BoxFit.cover,
                ),
              ),
              title: Text(
                '${chat.sender.firstName} ${chat.sender.lastName}}',
                style: themeData.textTheme.bodyMedium
                    ?.copyWith(fontWeight: FontWeight.w600),
              ),
              subtitle: RichText(
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                text: TextSpan(children: [
                  TextSpan(
                    text: '${chat.lastMessage.senderUuid}: ',
                    style: themeData.textTheme.bodySmall?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  TextSpan(
                    text: chat.lastMessage.messsage,
                    style: themeData.textTheme.bodySmall?.copyWith(
                      fontWeight: FontWeight.w400,
                      color: themeData.canvasColor,
                    ),
                  )
                ]),
              ),
            ),
          ),
        );
      },
    );
  }
}

import 'package:chat_app/features/chats_and_calls/chats/domain/entities/chat_entity.dart';
import 'package:chat_app/core/shared/widgets/avatar_widget.dart';
import 'package:flutter/material.dart';

class MessageCard extends StatelessWidget {
  const MessageCard({
    super.key,
    required this.chat,
    required this.themeData,
    this.onTap,
  });

  final ChatEntity chat;
  final ThemeData themeData;
  final Function(String)? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      constraints: BoxConstraints(minHeight: 75),
      child: Material(
        color: Colors.white,
        child: ListTile(
          onTap: () {
            onTap != null ? onTap!('') : () {};
          },
          contentPadding: const EdgeInsets.symmetric(horizontal: 28),
          leading: AvatarWidget(size: 25, user: chat.sender),
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
  }
}

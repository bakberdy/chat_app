import 'package:chat_app/features/chats_and_calls/chats/domain/entities/chat_entity.dart';
import 'package:chat_app/core/shared/widgets/info_widget.dart';
import 'package:chat_app/features/chats_and_calls/chats/presentation/widgets/message_card.dart';
import 'package:chat_app/core/shared/widgets/refreshable_list_view.dart';
import 'package:flutter/material.dart';

class ChatList extends StatelessWidget {
  const ChatList({
    super.key,
    required this.chats,
    required this.onTap,
    this.onAddToFriend,
    required this.isLoading,
    required this.onRefresh,
  });

  final List<ChatEntity> chats;
  final Function(String uuid) onTap;
  final Function(String uuid)? onAddToFriend;
  final bool isLoading;
  final Future Function() onRefresh;

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return RefreshableListView(
      themeData: themeData,
      isLoading: isLoading,
      onRefresh: onRefresh,
      emptyListWidget: InfoWidget(),
      itemBuilder: (context, index) {
        final chat = chats[index];
        return MessageCard(chat: chat, themeData: themeData);
      },
      itemCount: chats.length,
      separatorBuilder: (context, index) {
        return Divider(thickness: 1,height: 1, color: themeData.hintColor.withAlpha(30));
      },
    );
  }
}


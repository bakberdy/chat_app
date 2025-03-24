import 'package:chat_app/core/widgets/cupertino_segmented_menu.dart';
import 'package:chat_app/core/widgets/custom_search_bar.dart';
import 'package:chat_app/domain/entities/chat_entity.dart';
import 'package:chat_app/domain/entities/message_entity.dart';
import 'package:chat_app/domain/entities/user_entity.dart';
import 'package:chat_app/presentation/widgets/chat_list.dart';
import 'package:chat_app/presentation/widgets/scrollable_page_with_app_bar.dart';
import 'package:faker/faker.dart' show Faker;
import 'package:flutter/material.dart';

class ChatsAndCalls extends StatefulWidget {
  const ChatsAndCalls({super.key});

  @override
  State<ChatsAndCalls> createState() => _ChatsAndCallsState();
}

class _ChatsAndCallsState extends State<ChatsAndCalls> {
   ValueNotifier<ChatsAndCallsPageStatus> currentPageNotifier = ValueNotifier(ChatsAndCallsPageStatus.messages);

  @override
  Widget build(BuildContext context) {
    final faker = Faker();

    final List<MessageEntity> messages = List.generate(10, (index) {
      final sender = faker.randomGenerator.boolean() ? 'user1' : 'user2';
      final receiver = sender == 'user1' ? 'user2' : 'user1';
      return MessageEntity(
        messsage: faker.lorem.sentence(),
        senderUuid: sender,
        receiverUuid: receiver,
        createdAt: faker.date.dateTime(minYear: 2023, maxYear: 2025),
      );
    });

    final chat = ChatEntity(
      chatId: faker.guid.guid(),
      messages: messages,
      sender: UserEntity(
        email: "",
          firstName: 'firstName',
          friendStatus: FriendStatus.friends,
          lastName: 'lastName',
          uuid: 'uuid',
          userAvatar:
              'https://theteam.blog/wp-content/uploads/2024/01/jeff-bezos-leadership-style-1024x1024.jpg',
          lastOnline: DateTime.now()),
      lastMessage: messages[0],
    );
    final chat2 = ChatEntity(
      chatId: faker.guid.guid(),
      messages: messages,
      sender: UserEntity(
          firstName: 'FFFFFFFFFFFFFFf',
          friendStatus: FriendStatus.friends,
          lastName: 'lastName',
          uuid: 'uuid7',
          userAvatar:
              'https://theteam.blog/wp-content/uploads/2024/01/jeff-bezos-leadership-style-1024x1024.jpg',
          lastOnline: DateTime.now(), email: ''),
      lastMessage: messages[0],
    );

    final themeData = Theme.of(context);
    return Scaffold(
      backgroundColor: Color(0xffF7F7F9),
        body: ScrollablePageWithAppBar(
      appBarTitle: 'Chats',
      body: ValueListenableBuilder<ChatsAndCallsPageStatus>(
          valueListenable: currentPageNotifier,
          builder: (context, currentPage, _) {
            return Material(
              color: Colors.white,
              child: Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: CupertinoSegmentedMenu<ChatsAndCallsPageStatus>(
                      onValueChanged: (ChatsAndCallsPageStatus? value) {
                        if (value != null) {
                          currentPageNotifier.value = value;
                        }
                      },
                      groupValue: currentPage,
                      children: <ChatsAndCallsPageStatus, Widget>{
                        ChatsAndCallsPageStatus.messages: Text(
                          'Messages',
                          style: themeData.textTheme.bodySmall?.copyWith(
                            fontWeight: FontWeight.w600,
                            color: currentPage == ChatsAndCallsPageStatus.messages
                                ? null
                                : (themeData.hintColor),
                          ),
                        ),
                        ChatsAndCallsPageStatus.calls: Text(
                          'Calls',
                          style: themeData.textTheme.bodySmall?.copyWith(
                            fontWeight: FontWeight.w600,
                            color: currentPage == ChatsAndCallsPageStatus.calls
                                ? null
                                : (themeData.hintColor),
                          ),
                        ),
                      },
                    ),
                  ),
                  SizedBox(height: 10,),
                  currentPage == ChatsAndCallsPageStatus.messages
                      ? ChatList(
                          chats: [chat],
                          onTap: (String uuid) {},
                        )
                      : ChatList(
                          chats: [chat2],
                          onTap: (String uuid) {},
                          onAddToFriend: (String uuid) {}),
                          
                ],
              ),
            );
          }),
    ));
  }
}

enum ChatsAndCallsPageStatus {
  messages,
  calls,
}

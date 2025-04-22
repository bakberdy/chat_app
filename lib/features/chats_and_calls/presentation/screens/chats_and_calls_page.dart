import 'package:chat_app/core/shared/widgets/cupertino_segmented_menu.dart';
import 'package:chat_app/core/shared/widgets/custom_search_bar.dart';
import 'package:chat_app/features/chats_and_calls/chats/domain/entities/chat_entity.dart';
import 'package:chat_app/features/chats_and_calls/chats/domain/entities/message_entity.dart';
import 'package:chat_app/core/shared/entities/user_entity.dart';
import 'package:chat_app/features/chats_and_calls/chats/presentation/widgets/chat_list.dart';
import 'package:chat_app/core/shared/widgets/scrollable_page_with_app_bar.dart';
import 'package:faker/faker.dart' show Faker;
import 'package:flutter/material.dart';

class ChatsAndCalls extends StatefulWidget {
  const ChatsAndCalls({super.key});

  @override
  State<ChatsAndCalls> createState() => _ChatsAndCallsState();
}

class _ChatsAndCallsState extends State<ChatsAndCalls>
    with SingleTickerProviderStateMixin {
  late final TabController tabController;
  final ValueNotifier<int> currentPageNotifier = ValueNotifier<int>(0);

  @override
  void dispose() {
    tabController.dispose();
    currentPageNotifier.dispose();
    super.dispose();
  }

  late final Faker faker;
  late final List<MessageEntity> messages;
  late final ChatEntity chat;
  late final ChatEntity chat2;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    tabController.animation!.addListener(() {
      final value = tabController.animation!.value;
      final newIndex = value.round();
      if (currentPageNotifier.value != newIndex) {
        currentPageNotifier.value = newIndex;
      }
    });
    super.initState();

    faker = Faker();

    messages = List.generate(10, (index) {
      final sender = faker.randomGenerator.boolean() ? 'user1' : 'user2';
      final receiver = sender == 'user1' ? 'user2' : 'user1';
      return MessageEntity(
        messsage: faker.lorem.sentence(),
        senderUuid: sender,
        receiverUuid: receiver,
        createdAt: faker.date.dateTime(minYear: 2023, maxYear: 2025),
      );
    });

    chat = ChatEntity(
      chatId: faker.guid.guid(),
      messages: messages,
      sender: UserEntity(
        email: "",
        firstName: 'firstName',
        lastName: 'lastName',
        uid: 'uuid',
        userAvatar: 'https://theteam.blog/wp-content/uploads/2024/01/'
            'jeff-bezos-leadership-style-1024x1024.jpg',
        lastOnline: DateTime.now(),
      ),
      lastMessage: messages[0],
    );

    chat2 = ChatEntity(
      chatId: faker.guid.guid(),
      messages: messages,
      sender: UserEntity(
        firstName: 'FFFFFFFFFFFFFFf',
        lastName: 'lastName',
        uid: 'uuid7',
        userAvatar: 'https://theteam.blog/wp-content/uploads/2024/01/'
            'jeff-bezos-leadership-style-1024x1024.jpg',
        lastOnline: DateTime.now(),
        email: '',
      ),
      lastMessage: messages[0],
    );
  }

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Scaffold(
        backgroundColor: Color(0xffF7F7F9),
        body: ScrollablePageWithAppBar(
          appBarTitle: 'Chats',
          body: ValueListenableBuilder<int>(
              valueListenable: currentPageNotifier,
              builder: (context, currentPage, _) {
                return Material(
                  color: Colors.white,
                  child: Column(
                    children: [
                      SizedBox(
                        width: double.infinity,
                        child: CupertinoSegmentedMenu<int>(
                          onValueChanged: (int? value) {
                            if (value != null) {
                              if (currentPage != value) {
                                tabController.animateTo(value,
                                    duration: Duration(milliseconds: 300),
                                    curve: Curves.linear);
                              }
                              currentPageNotifier.value = value;
                            }
                          },
                          groupValue: currentPage,
                          children: <int, Widget>{
                            0: Text(
                              'Messages',
                              style: themeData.textTheme.bodySmall?.copyWith(
                                fontWeight: FontWeight.w600,
                                color: currentPage == 0
                                    ? null
                                    : (themeData.hintColor),
                              ),
                            ),
                            1: Text(
                              'Calls',
                              style: themeData.textTheme.bodySmall?.copyWith(
                                fontWeight: FontWeight.w600,
                                color: currentPage == 1
                                    ? null
                                    : (themeData.hintColor),
                              ),
                            ),
                          },
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Flexible(
                        child: TabBarView(controller: tabController, children: [
                          ChatList(
                            chats: [chat],
                            onTap: (String uuid) {},
                            isLoading: false,
                            onRefresh: () async {},
                          ),
                          ChatList(
                            chats: [chat2],
                            onTap: (String uuid) {},
                            onAddToFriend: (String uuid) {},
                            isLoading: false,
                            onRefresh: () async {},
                          ),
                        ]),
                      )
                    ],
                  ),
                );
              }),
        ));
  }
}

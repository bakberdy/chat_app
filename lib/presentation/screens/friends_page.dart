import 'package:chat_app/core/widgets/cupertino_segmented_menu.dart';
import 'package:chat_app/domain/entities/user_entity.dart';
import 'package:chat_app/presentation/widgets/friends_list.dart';
import 'package:chat_app/presentation/widgets/scrollable_page_with_app_bar.dart';
import 'package:flutter/material.dart';

class FriendsPage extends StatefulWidget {
  const FriendsPage({super.key});

  @override
  State<FriendsPage> createState() => _FriendsPageState();
}

class _FriendsPageState extends State<FriendsPage> {
  final ValueNotifier<FriendsPageStatus> currentPageNotifier =
      ValueNotifier<FriendsPageStatus>(FriendsPageStatus.myfriends);

  final List<UserEntity> friends = List.generate(10, (index) {
    return UserEntity(
      email: "",
      firstName: 'FriendFirstName$index',
      lastName: 'LastName$index',
      uuid: 'uuid_$index',
      userAvatar:
          'https://cdn.vanguardngr.com/wp-content/uploads/2024/11/elon-musk-fighter.jpg',
      lastOnline: DateTime.now().subtract(Duration(minutes: index * 10)),
      friendStatus: FriendStatus.friends,
    );
  });

  final List<UserEntity> allUsers = List.generate(10, (index) {
    return UserEntity(
      email: "",
      firstName: 'UserFirstName$index',
      lastName: 'LastName$index',
      uuid: 'uuid_$index',
      userAvatar:
          'https://th.bing.com/th/id/OIP.EX0-Yx--hWcz1Y18ovq8TQHaHa?rs=1&pid=ImgDetMain',
      lastOnline: DateTime.now().subtract(Duration(minutes: index * 15)),
      friendStatus: FriendStatus.notFriend,
    );
  });

  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);

    return Scaffold(
      backgroundColor: Color(0xffF7F7F9),
        body: ScrollablePageWithAppBar(
          searchController: searchController,
      appBarTitle: 'Friends',
      body: ValueListenableBuilder<FriendsPageStatus>(
        valueListenable: currentPageNotifier,
        builder: (context, currentPage, _) {
          return Material(
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 42,
                  width: double.infinity,
                  child: CupertinoSegmentedMenu<FriendsPageStatus>(
                    onValueChanged: (FriendsPageStatus? value) {
                      if (value != null) {
                        currentPageNotifier.value = value;
                      }
                    },
                    groupValue: currentPage,
                    children: <FriendsPageStatus, Widget>{
                      FriendsPageStatus.myfriends: Text(
                        'Friends',
                        style: themeData.textTheme.bodySmall?.copyWith(
                          fontWeight: FontWeight.w600,
                          color: currentPage == FriendsPageStatus.myfriends
                              ? null
                              : themeData.hintColor,
                        ),
                      ),
                      FriendsPageStatus.all: Text(
                        'All',
                        style: themeData.textTheme.bodySmall?.copyWith(
                          fontWeight: FontWeight.w600,
                          color: currentPage == FriendsPageStatus.all
                              ? null
                              : themeData.hintColor,
                        ),
                      ),
                    },
                  ),
                ),
                SizedBox(height: 10),
                currentPage == FriendsPageStatus.myfriends
                    ? FriendsList(
                        friends: friends,
                        onTap: (String uuid) {},
                      )
                    : FriendsList(
                        friends: allUsers,
                        onTap: (String uuid) {},
                        onAddToFriend: (String uuid) {},
                      ),
              ],
            ),
          );
        },
      ),
    ));
  }
}

enum FriendsPageStatus {
  all,
  myfriends,
}

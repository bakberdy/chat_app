import 'package:chat_app/core/shared/widgets/refreshable_list_view.dart';
import 'package:chat_app/features/users/presentation/widgets/user_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:chat_app/core/shared/entities/user_entity.dart';
import 'package:chat_app/core/shared/widgets/info_widget.dart';

class UsersList extends StatelessWidget {
  const UsersList({
    super.key,
    required this.users,
    required this.onTap,
    this.onAddToFriend,
    required this.onRefresh,
    required this.isLoading,
  });

  final List<UserEntity> users;
  final Function(int userId) onTap;
  final Function(String uuid)? onAddToFriend;
  final Future<void> Function() onRefresh;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);

    return RefreshableListView(
      themeData: themeData,
      isLoading: isLoading,
      onRefresh: onRefresh,
      emptyListWidget: InfoWidget(
        imagePath: 'lib/assets/illustrations/no_users_illustration.png',
        title: 'No users found',
        subtitle: 'Please refresh the page and try again.',
      ),
      itemBuilder: (context, index) {
        final user = users[index];
        return UserCard(
          user: user,
          themeData: themeData,
          onTap: onTap,
          onAddToFriend: onAddToFriend,
        );
      },
      itemCount: users.length,
    );
  }
}

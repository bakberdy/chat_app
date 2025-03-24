import 'package:chat_app/core/extensions/time_extensions.dart';
import 'package:chat_app/domain/entities/user_entity.dart';
import 'package:flutter/material.dart';

class FriendsList extends StatelessWidget {
  const FriendsList({
    super.key,
    required this.friends,
    required this.onTap,
    this.onAddToFriend,
  });

  final List<UserEntity> friends;
  final Function(String uuid) onTap;
  final Function(String uuid)? onAddToFriend;

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return ListView.builder(
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: friends.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        final friend = friends[index];
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
              minTileHeight: 75,
              dense: true,
              onTap: () => onTap(friend.uuid),
              contentPadding: const EdgeInsets.symmetric(horizontal: 28),
              leading: ClipOval(
                child: Image.network(
                  friend.userAvatar,
                  height: 50,
                  width: 50,
                  fit: BoxFit.cover,
                ),
              ),
              trailing: friend.friendStatus == FriendStatus.notFriend
                  ? IconButton(
                      tooltip: 'ADD TO FRIEND',
                      onPressed: onAddToFriend == null
                          ? null
                          : () => onAddToFriend!(friend.uuid),
                      icon: const Icon(Icons.add),
                    )
                  : null,
              title: Text(
                '${friend.firstName} ${friend.lastName}',
                style: themeData.textTheme.bodyMedium
                    ?.copyWith(fontWeight: FontWeight.w600),
              ),
              subtitle: Text(
                friend.lastOnline.toLastActiveString(),
                style: themeData.textTheme.bodySmall?.copyWith(
                  fontWeight: FontWeight.w400,
                  color: const Color(0xff7D04FF),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

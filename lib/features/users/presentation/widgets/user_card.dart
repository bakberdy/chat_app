import 'package:chat_app/core/extensions/time_extensions.dart';
import 'package:chat_app/core/shared/entities/user_entity.dart';
import 'package:chat_app/core/shared/widgets/avatar_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserCard extends StatelessWidget {
  const UserCard({
    super.key,
    required this.user,
    required this.themeData,
    required this.onTap,
    this.onAddToFriend,
  });

  final UserEntity user;
  final ThemeData themeData;
  final Function(int userId) onTap;
  final Function(String uuid)? onAddToFriend;

  @override
  Widget build(BuildContext context) {
    return CupertinoContextMenu(
      actions: [
        CupertinoContextMenuAction(
          onPressed: () {
            Navigator.of(context, rootNavigator: true).maybePop();
          },
          isDestructiveAction: true,
          trailingIcon: CupertinoIcons.delete,
          child: const Text('Delete  From Friends'),
        ),
      ],
      child: Container(
        clipBehavior: Clip.hardEdge,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                offset: Offset(0, 0),
                blurRadius: 6,
                color: Color(0xff000000).withAlpha(25))
          ],
          borderRadius: BorderRadius.circular(8),
        ),
        constraints: BoxConstraints(
            minHeight: 75, maxWidth: MediaQuery.of(context).size.width),
        child: Material(
          color: Colors.white,
          child: ListTile(
            minTileHeight: 75,
            dense: true,
            onTap: () => onTap(user.id),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            leading: AvatarWidget(size: 25, user: user),
            title: Text(
              '${user.firstName} ${user.lastName}',
              style: themeData.textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            subtitle: Text(
              user.lastOnlineAt.toLastActiveString(),
              style: themeData.textTheme.bodySmall?.copyWith(
                fontWeight: FontWeight.w400,
                color: const Color(0xff7D04FF),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

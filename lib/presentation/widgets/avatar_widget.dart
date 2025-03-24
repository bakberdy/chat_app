import 'package:chat_app/domain/entities/user_entity.dart';
import 'package:flutter/material.dart';

class AvatarWidget extends StatelessWidget {
  final double size;
  const AvatarWidget({
    required this.size,
    super.key,
    required this.user,
  });

  final UserEntity user;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircleAvatar(
          radius: size, backgroundImage: NetworkImage(user.userAvatar)),
    );
  }
}
import 'package:chat_app/core/shared/entities/entities.dart';
import 'package:chat_app/core/shared/widgets/avatar_widget.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class UserInfoWidget extends StatelessWidget {
  const UserInfoWidget({
    super.key,
    required this.user,
    required this.isLoading,
  });

  final UserEntity? user;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        isLoading || user == null
            ? Shimmer.fromColors(
                baseColor: Colors.grey[100]!,
                highlightColor: Colors.grey[300]!,
                child: Container(
                  alignment: Alignment.center,
                  decoration:
                      BoxDecoration(shape: BoxShape.circle, color: Colors.grey),
                  height: 160,
                  width: 160,
                ),
              )
            : Center(child: AvatarWidget(user: user!, size: 80)),
        SizedBox(height: 10),
        Center(
          child: Column(
            children: [
              isLoading || user == null
                  ? Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      child: Container(
                          height: 20,
                          width: 180,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: Colors.black,
                          )))
                  : Text(
                      '${user!.lastName} ${user!.firstName}',
                      style: TextStyle(fontSize: 18),
                    ),
              isLoading || user == null
                  ? Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      child: Container(
                        margin: EdgeInsets.only(top: 10),
                        height: 16,
                        width: 120,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: Colors.black),
                      ))
                  : Text(
                      user!.email,
                      style: TextStyle(fontSize: 16, color: Colors.black45),
                    ),
            ],
          ),
        ),
      ],
    );
  }
}

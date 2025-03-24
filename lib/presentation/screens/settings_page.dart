import 'package:chat_app/domain/entities/user_entity.dart';
import 'package:chat_app/presentation/screens/profile_page.dart';
import 'package:chat_app/presentation/widgets/avatar_widget.dart';
import 'package:chat_app/presentation/widgets/buttons_list.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  SettingsPage({super.key});

  final user = UserEntity(
      email: "bakberdy.ye@gmail.com",
      firstName: 'Bakberdi',
      lastName: 'Yessentay',
      uuid: 'sjhwjbw',
      userAvatar:
          'https://images.vexels.com/media/users/3/145908/raw/52eabf633ca6414e60a7677b0b917d92-male-avatar-maker.jpg',
      lastOnline: DateTime.now(),
      userStatus: 'Be a good human');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffF7F7F9),
        appBar: AppBar(
          backgroundColor: Color(0xffF7F7F9),
          foregroundColor: Color(0xffF7F7F9),
          shadowColor: Colors.white,
          actions: [
            TextButton(
              onPressed: () {},
              style: ButtonStyle(
                  enableFeedback: true,
                  padding: WidgetStatePropertyAll(
                      EdgeInsets.symmetric(horizontal: 10, vertical: 0)),
                  backgroundColor:
                      WidgetStatePropertyAll(Colors.grey.shade200)),
              child: Text('edit'),
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 15),
              AvatarWidget(
                user: user,
                size: 80,
              ),
              SizedBox(height: 10),
              Center(
                child: Column(
                  children: [
                    Text(
                      '${user.lastName} ${user.firstName}',
                      style: TextStyle(fontSize: 20),
                    ),
                    Text(
                      user.email,
                      style: TextStyle(fontSize: 16, color: Colors.black45),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 25),
              ButtonsList(
                children: [
                  ButtonDetails(
                    onTap: () => Navigator.pushNamed(context, '/profile', arguments: null),
                    title: 'Profile',
                    prefixIcon: SizedBox(height: 25, width: 25,child: Image.asset('lib/assets/icons/profile.png'))
                  ),
                ],
              ),
              SizedBox(height: 20),
              ButtonsList(
                children: [
                  ButtonDetails(
                    onTap: () {},
                    title: 'Talky Features',
                    prefixIcon: SizedBox(height: 25, width: 25,child: Image.asset('lib/assets/icons/feature.png'))
                  ),
                  ButtonDetails(
                    onTap: () {},
                    title: 'Talky FAQ',
                    prefixIcon: SizedBox(height: 25, width: 25,child: Image.asset('lib/assets/icons/question.png'))
                  )
                ],
              )
            ],
          ),
        ));
  }
}





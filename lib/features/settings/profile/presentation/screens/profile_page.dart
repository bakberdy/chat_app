import 'package:chat_app/core/shared/entities/user_entity.dart';
import 'package:chat_app/core/shared/widgets/avatar_widget.dart';
import 'package:chat_app/features/settings/presentation/widgets/buttons_list.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  final String? userId;
  const ProfilePage({super.key, required this.userId});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late final user;

  @override
  void initState() {
    print('guuuuuuuuuuuuuuuuuuuu');
    if (widget.userId != null) {
      //send query to get user
      user = UserEntity(
          email: "bakberdy.ye@gmail.com",
          firstName: 'Bakberdi',
          lastName: 'Yessentay',
          uid: 'sjhwjbw',
          userAvatar:
              'https://images.vexels.com/media/users/3/145908/raw/52eabf633ca6414e60a7677b0b917d92-male-avatar-maker.jpg',
          lastOnline: DateTime.now(),
          userStatus: 'Be a good human');
    } else {
      user = UserEntity(
          email: "Please return back and try again",
          firstName: "User doesn't exist",
          lastName: '',
          uid: 'sjhwjbw',
          userAvatar:
              'https://www.evolvefish.com/assets/images/Decals/EF-VDC-00035(Black).jpg',
          lastOnline: DateTime.now(),
          userStatus: '');
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffF7F7F9),
        appBar: AppBar(
          automaticallyImplyLeading: true,
          backgroundColor: Color(0xffF7F7F9),
          foregroundColor: Color.fromARGB(255, 1, 1, 236),
          shadowColor: Colors.white,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 15),
              Center(
                child: AvatarWidget(user: user, size: 80),
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
                      onTap: () {},
                      title: 'Talky Features',
                      prefixIcon: SizedBox(
                          height: 25,
                          width: 25,
                          child: Image.asset('lib/assets/icons/feature.png'))),
                  ButtonDetails(
                      onTap: () {},
                      title: 'Talky FAQ',
                      prefixIcon: SizedBox(
                          height: 25,
                          width: 25,
                          child: Image.asset('lib/assets/icons/question.png')))
                ],
              )
            ],
          ),
        ));
  }
}

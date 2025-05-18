import 'package:chat_app/core/shared/entities/user_entity.dart';

class TempData {
  static Future<List<UserEntity>> getFriends() async {
    return friends;
  }

  static Future<List<UserEntity>> getAllUsers() async {
    return allUsers;
  }

  static final List<UserEntity> friends = List.generate(100, (index) {
    return UserEntity(
      email: "",
      firstName: 'FriendFirstName$index',
      lastName: 'LastName$index',
      uid: 'uuid_$index',
      profilePicture:
          'https://cdn.vanguardngr.com/wp-content/uploads/2024/11/elon-musk-fighter.jpg',
      lastOnline: DateTime.now().subtract(Duration(minutes: index * 10)),
      createdAt: DateTime(0),
      birthDate: '',
      userStatus: '',
    );
  });

  static final List<UserEntity> allUsers = List.generate(10, (index) {
    return UserEntity(
      email: "",
      firstName: 'UserFirstName$index',
      lastName: 'LastName$index',
      uid: 'uuid_$index',
      profilePicture:
          'https://th.bing.com/th/id/OIP.EX0-Yx--hWcz1Y18ovq8TQHaHa?rs=1&pid=ImgDetMain',
      lastOnline: DateTime.now().subtract(Duration(minutes: index * 15)),
      createdAt: DateTime(0),
      birthDate: '',
      userStatus: '',
    );
  });
}

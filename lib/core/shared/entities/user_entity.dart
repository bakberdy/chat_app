class UserEntity {
  final String firstName;
  final String lastName;
  final String uid;
  final String? userAvatar;
  final DateTime lastOnline;
  final String email;
  final String? userStatus;
  final bool isOnline;

  UserEntity(
      {required this.firstName,
      this.isOnline= false, 
      this.userStatus, 
      required this.email,
      required this.lastName,
      required this.uid,
      required this.userAvatar,
      required this.lastOnline});
}

enum FriendStatus {
  friends,

  requestSent,

  requestReceived,

  notFriend
}

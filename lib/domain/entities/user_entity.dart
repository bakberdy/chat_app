class UserEntity {
  final String firstName;
  final String lastName;
  final String uuid;
  final String userAvatar;
  final DateTime lastOnline;
  final FriendStatus? friendStatus;
  final String email;
  final String? userStatus;

  UserEntity(
      {required this.firstName,
      this.userStatus, 
      required this.email,
      this.friendStatus,
      required this.lastName,
      required this.uuid,
      required this.userAvatar,
      required this.lastOnline});
}

enum FriendStatus {
  friends,

  requestSent,

  requestReceived,

  notFriend
}

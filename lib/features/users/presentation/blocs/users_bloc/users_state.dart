part of 'users_bloc.dart';

@immutable
class UsersState {
  final List<UserEntity> friends;
  final List<UserEntity> allUsers;
  final StateStatus status;
  final StateStatus allUsersStatus;
  final StateStatus friendsStatus;

  const UsersState(
      {this.allUsersStatus = StateStatus.initial,
      this.friendsStatus = StateStatus.initial,
      this.status = StateStatus.initial,
      this.friends = const [],
      this.allUsers = const []});

  UsersState copyWith({
    StateStatus? status,
    StateStatus? allUsersStatus,
    StateStatus? friendsStatus,
    List<UserEntity>? friends,
    List<UserEntity>? allUsers,
  }) {
    return UsersState(
      status: status ?? this.status,
      friends: friends ?? this.friends,
      allUsers: allUsers ?? this.allUsers,
      allUsersStatus: allUsersStatus ?? this.allUsersStatus,
      friendsStatus: allUsersStatus ?? this.friendsStatus,
    );
  }
}

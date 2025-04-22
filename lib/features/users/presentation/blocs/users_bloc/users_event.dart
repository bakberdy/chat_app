part of 'users_bloc.dart';

@immutable
sealed class UsersEvent {}

class LoadAllUsersRequested extends UsersEvent{}
class LoadFriendsRequested extends UsersEvent{}

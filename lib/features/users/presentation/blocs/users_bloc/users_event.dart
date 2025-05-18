part of 'users_bloc.dart';


sealed class UsersEvent {}

class LoadAllUsersRequested extends UsersEvent{}
class LoadFriendsRequested extends UsersEvent{}

import 'package:bloc/bloc.dart';
import 'package:chat_app/core/bloc/state_status.dart';
import 'package:chat_app/core/shared/entities/user_entity.dart';
import 'package:chat_app/temp_data.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'users_event.dart';
part 'users_state.dart';


@singleton
class UsersBloc extends Bloc<UsersEvent, UsersState> {
  UsersBloc() : super(UsersState()) {
    on<LoadAllUsersRequested>((event, emit) async{
      emit(state.copyWith(status: LoadingStatus(), allUsersStatus: LoadingStatus()));
      final users = await TempData.getAllUsers();
      await Future.delayed(Duration(seconds: 2));
      emit(state.copyWith(status: SuccessStatus(), allUsersStatus: SuccessStatus(),allUsers: users));
    });
    on<LoadFriendsRequested>((event, emit) async{
       emit(state.copyWith(status: LoadingStatus(), friendsStatus: LoadingStatus()));
      final users = await TempData.getFriends();
      await Future.delayed(Duration(seconds: 2));
      emit(state.copyWith(status: SuccessStatus(), friends: users, friendsStatus: SuccessStatus()));
    });
  }
}

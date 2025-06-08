import 'dart:async';
import 'dart:io';

import 'package:chat_app/features/settings/profile/domain/usecases/get_user_profile.dart';
import 'package:chat_app/features/settings/profile/domain/usecases/update_profile_data.dart';
import 'package:chat_app/features/settings/profile/domain/usecases/update_profile_picture.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/core.dart';

part 'profile_event.dart';
part 'profile_state.dart';
part 'profile_bloc.freezed.dart';

@injectable
class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc(
      this._updateProfileData, this._updateProfilePicture, this._getUserProfile)
      : super(ProfileState()) {
    on<ProfileEvent>(_eventHandler);
  }

  final UpdateProfileData _updateProfileData;
  final UpdateProfilePicture _updateProfilePicture;
  final GetUserProfile _getUserProfile;

  Future<void> _eventHandler(
      ProfileEvent event, Emitter<ProfileState> emit) async {
    switch (event) {
      case _GetCurrentUserProfile(userId: final String userId):
        emit(state.copyWith(status: ProfileStateStatus.loading));
        final failureOrSuccess = await _getUserProfile(userId);
        failureOrSuccess.fold(
            (failure) => emit(state.copyWith(errorMessage: failure.message)),
            (user) => emit(state.copyWith(
                status: ProfileStateStatus.loaded,
                user: user)));
      case _UpdateProfileData(
          userId: final String userId,
          firstName: final String? firstName,
          lastName: final String? lastName,
          birthDate: final String? birthDate
        ):
        emit(ProfileState(status: ProfileStateStatus.loading));
        final failureOrSuccess = await _updateProfileData(
            UpdateProfileDataParams(
                firstName: firstName,
                userId: userId,
                lastName: lastName,
                birthDate: birthDate));
        failureOrSuccess.fold((e) {
          emit(state.copyWith(errorMessage: e.message));
        }, (_) {
          emit(state.copyWith(status: ProfileStateStatus.success));
        });
      case _UpdateProfilePicture(
          userId: final String userId,
          picture: final File picture
        ):
        emit(state.copyWith(status: ProfileStateStatus.loading));
        final failureOrSuccess = await _updateProfilePicture(
            UpdateProfilePictureParams(userId: userId, picture: picture));
        failureOrSuccess.fold((e) {
          emit(state.copyWith(status: ProfileStateStatus.error,errorMessage: e.message));
        }, (_) {
          emit(state.copyWith(status: ProfileStateStatus.success));
          add(ProfileEvent.getCurrentUserProfile(userId: userId));
        });
    }
  }
}

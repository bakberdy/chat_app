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
      : super(ProfileState.initial()) {
    on<ProfileEvent>(_eventHandler);
  }

  final UpdateProfileData _updateProfileData;
  final UpdateProfilePicture _updateProfilePicture;
  final GetUserProfile _getUserProfile;

  Future<void> _eventHandler(
      ProfileEvent event, Emitter<ProfileState> emit) async {
    switch (event) {
      case _GetCurrentUserProfile(userId: final String userId):
        emit(ProfileState.loading());
        final failureOrSuccess = await _getUserProfile(userId);
        failureOrSuccess.fold(
            (failure) => emit(ProfileState.error(message: failure.message)),
            (user) => emit(ProfileState.loaded(currentUserProfile: user)));
      case _UpdateProfileData(
          userId: final String userId,
          firstName: final String? firstName,
          lastName: final String? lastName,
          birthDate: final String? birthDate
        ):
        emit(ProfileState.loading());
        final failureOrSuccess = await _updateProfileData(
            UpdateProfileDataParams(
                firstName: firstName,
                userId: userId,
                lastName: lastName,
                birthDate: birthDate));
        failureOrSuccess.fold((e) {
          emit(ProfileState.error(message: e.message));
        }, (_) {
          emit(ProfileState.success());
        });
      case _UpdateProfilePicture(
          userId: final String userId,
          picture: final File picture
        ):
        emit(ProfileState.loading());
        final failureOrSuccess = await _updateProfilePicture(
            UpdateProfilePictureParams(userId: userId, picture: picture));
        failureOrSuccess.fold((e) {
          emit(ProfileState.error(message: e.message));
        }, (_) {
          emit(ProfileState.success());
        });
    }
  }
}

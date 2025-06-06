part of 'profile_bloc.dart';

@freezed
sealed class ProfileEvent with _$ProfileEvent {
  factory ProfileEvent.getCurrentUserProfile({required String userId}) =
      _GetCurrentUserProfile;
  factory ProfileEvent.updateProfileData(
      {required String userId,
      String? firstName,
      String? lastName,
      String? birthDate}) = _UpdateProfileData;
  factory ProfileEvent.updateProfilePicture(
      {required String userId, required File picture}) = _UpdateProfilePicture;
}

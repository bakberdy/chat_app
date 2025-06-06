part of 'profile_bloc.dart';

@freezed
sealed class ProfileState with _$ProfileState {
  factory ProfileState.initial() = ProfileInitial;
  factory ProfileState.loading() = ProfileLoading;
  factory ProfileState.loaded({required UserEntity currentUserProfile}) =
      ProfileLoaded;
  factory ProfileState.success() = ProfileSuccess;
  factory ProfileState.error({required String message}) = ProfileError;
}

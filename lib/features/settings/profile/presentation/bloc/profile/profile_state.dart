part of 'profile_bloc.dart';

@freezed
sealed class ProfileState with _$ProfileState {
  factory ProfileState({
    @Default(ProfileStateStatus.loading) ProfileStateStatus status,
    UserEntity? user,
    @Default('') String errorMessage,
  }) = _ProfileState;
}

enum ProfileStateStatus {
  loading,
  loaded,
  success,
  error,
}

part of 'auth_bloc.dart';

@freezed
class AuthEvent with _$AuthEvent {
  const factory AuthEvent.login(
      {required String emailOrUsername, required String password}) = _Login;
  const factory AuthEvent.register({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
    required String username,
  }) = _Register;
  const factory AuthEvent.changeRegisterStatus(
      {required RegistrationState status}) = _ChangeRegistrationStatus;

  const factory AuthEvent.changeTimeDuration({required int timeDuration}) =
      _ChangeTimeDuration;

  const factory AuthEvent.changePassword(
      {required String newPassword,
      required String oldPassword}) = _ChangePassword;

  const factory AuthEvent.getMe() = _GetMe;

  const factory AuthEvent.logOut() = _Logout;

  const factory AuthEvent.updateProfilePicture({required File? file}) =
      _UpdateProfilePicture;

  const factory AuthEvent.updateUserData(
      {required String? username,
      required String? lastName,
      required String? firstName,
      required String? birthDate}) = _UpdateUserData;

  const factory AuthEvent.resetPassword({required String email}) =
      _ResetPassword;
}

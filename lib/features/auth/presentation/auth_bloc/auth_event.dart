part of 'auth_bloc.dart';

@freezed
class AuthEvent with _$AuthEvent {
  const factory AuthEvent.signIn(
      {required String email, required String password}) = _SignIn;
  const factory AuthEvent.signUp(
      {required String email,
      required String password,
      required String firstName,
      required String lastName}) = _SignUp;
  const factory AuthEvent.changeSignUpStatus({required SignUpStatus status}) = _ChangeSignUpStatus;
  const factory AuthEvent.googleSignIn() = _GoogleSignIn;
  const factory AuthEvent.appleSignIn() = _AppleSignIn;
  const factory AuthEvent.sendResetMessageToEmail({required String email}) = _SendResetMessageToEmail;
  const factory AuthEvent.changeTimeDuration({required int timeDuration}) = _ChangeTimeDuration;
}

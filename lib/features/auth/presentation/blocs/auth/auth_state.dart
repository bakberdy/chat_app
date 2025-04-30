part of 'auth_bloc.dart';

@freezed
sealed class AuthState with _$AuthState {
  const factory AuthState(
      {@Default(StateStatus.initial) StateStatus signInStatus,
      @Default(SignUpStatus.initial) SignUpStatus signUpStatus,
      @Default(ResetPasswordStatus.initial) ResetPasswordStatus resetPassword,
      int? timerDuration,
      String? errorMessage}) = _AuthState;

}

enum SignUpStatus {
  initial,
  nameGot,
  success,
  loading,
  error,
}

enum ResetPasswordStatus {
  initial,
  waitingTimer,
  loading,
  success,
  error,
  tryAgain
}

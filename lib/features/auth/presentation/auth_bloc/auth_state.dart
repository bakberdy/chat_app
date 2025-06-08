part of 'auth_bloc.dart';

@freezed
sealed class AuthState with _$AuthState {
  const factory AuthState({
    @Default(AuthStatus.notAuthorized) AuthStatus authState,
    @Default(RegistrationState.nameInput) RegistrationState registrationState,
    @Default(StateStatus.initial) StateStatus status,
    @Default(ResetPasswordState.initial) ResetPasswordState resetPasswordState,
    UserEntity? currentUser,
    int? timerDuration,
    String? message,
  }) = _AuthState;
}

enum AuthStatus {
  authorized,
  notAuthorized,
}

extension AuthStatusX on AuthStatus {
  bool get isAuthorized => this == AuthStatus.authorized;
  bool get isNotAuthorized => this == AuthStatus.notAuthorized;
}

enum RegistrationState {
  nameInput,
  emailInput,
}

extension RegistrationStateX on RegistrationState {
  bool get isNameInput => this == RegistrationState.nameInput;
  bool get isEmailInput => this == RegistrationState.emailInput;
}

enum ResetPasswordState {
  initial,
  waitingTimer,
  tryAgain,
}

extension ResetPasswordStateX on ResetPasswordState {
  bool get isInitial => this == ResetPasswordState.initial;
  bool get isWaitingTimer => this == ResetPasswordState.waitingTimer;
  bool get isTryAgain => this == ResetPasswordState.tryAgain;
}

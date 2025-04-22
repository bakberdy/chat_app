part of 'reset_password_cubit.dart';

@immutable
sealed class ResetPasswordState {}

final class ResetPasswordInitial extends ResetPasswordState {}
final class ResetPasswordError extends ResetPasswordState {
  final String message;

  ResetPasswordError({required this.message});
}
final class ResetPasswordLoading extends ResetPasswordState {}
final class ResetPasswordWaitingTimer extends ResetPasswordState {
  final int seconds;

  ResetPasswordWaitingTimer({required this.seconds});
}
final class ResetPasswordMessageSent extends ResetPasswordState {}
final class ResetPasswordTryAgain extends ResetPasswordState {}

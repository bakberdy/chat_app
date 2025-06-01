import 'package:chat_app/features/auth/presentation/auth_bloc/auth_bloc.dart';
import 'package:flutter/material.dart';

class ResetPasswordTimerText extends StatelessWidget {
  const ResetPasswordTimerText(
      {super.key,
      required this.resetPasswordStatus,
      required this.themeData,
      required this.remainingTimeInSeconds});
  final ResetPasswordStatus resetPasswordStatus;
  final ThemeData themeData;
  final int? remainingTimeInSeconds;

  @override
  Widget build(BuildContext context) {
    return (resetPasswordStatus == ResetPasswordStatus.waitingTimer)
        ? Text("You can send code again after $remainingTimeInSeconds seconds",
            style: themeData.textTheme.bodySmall
                ?.copyWith(color: themeData.canvasColor))
        : SizedBox();
  }
}

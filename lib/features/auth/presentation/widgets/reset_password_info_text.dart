import 'package:chat_app/features/auth/presentation/auth_bloc/auth_bloc.dart';
import 'package:flutter/material.dart';

class ResetPasswordInfoText extends StatelessWidget {
  const ResetPasswordInfoText({super.key, required this.resetPasswordStatus});
  final ResetPasswordState resetPasswordStatus;

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    if ((resetPasswordStatus.isWaitingTimer)) {
      return Text(
          "We've sent a code to your email. Please check your inbox and reset your password. Then, try logging in with your new password.",
          style: themeData.textTheme.bodySmall?.copyWith(
            color: themeData.canvasColor,
            fontSize: 12,
          ));
    } else if (resetPasswordStatus.isTryAgain) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text("Send code again?",
                style: themeData.textTheme.bodySmall?.copyWith(
                    fontSize: 12, color: themeData.canvasColor, height: 1)),
          ),
        ],
      );
    } else {
      return SizedBox();
    }
  }
}

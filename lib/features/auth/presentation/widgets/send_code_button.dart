import 'package:chat_app/features/auth/presentation/auth_bloc/auth_bloc.dart';
import 'package:flutter/material.dart';

class SendCodeButton extends StatelessWidget {
  const SendCodeButton(
      {super.key, required this.resetPasswordStatus, required this.onPressed});

  final ResetPasswordStatus resetPasswordStatus;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return SizedBox(
        width: double.infinity,
        height: 50,
        child: FilledButton(
            style: ButtonStyle(
                shadowColor: WidgetStatePropertyAll(Colors.black.withAlpha(50)),
                backgroundColor: WidgetStatePropertyAll(
                    ((resetPasswordStatus == ResetPasswordStatus.loading) ||
                            (resetPasswordStatus ==
                                ResetPasswordStatus.waitingTimer))
                        ? Color(0xff7FACFF)
                        : themeData.primaryColor)),
            onPressed: ((resetPasswordStatus == ResetPasswordStatus.loading) ||
                    (resetPasswordStatus == ResetPasswordStatus.waitingTimer))
                ? null
                : () => onPressed(),
            child: (resetPasswordStatus == ResetPasswordStatus.loading)
                ? CircularProgressIndicator(color: Colors.white)
                : Text('Send code',
                    style: themeData.textTheme.bodyMedium
                        ?.copyWith(color: Colors.white))));
  }
}

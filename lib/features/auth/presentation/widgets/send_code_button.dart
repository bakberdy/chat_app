import 'package:chat_app/features/auth/presentation/auth_bloc/auth_bloc.dart';
import 'package:flutter/material.dart';

class SendCodeButton extends StatelessWidget {
  const SendCodeButton(
      {super.key,
      required this.resetPasswordState,
      required this.onPressed,
      required this.isLoading});

  final ResetPasswordState resetPasswordState;
  final bool isLoading;
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
                    (isLoading || (resetPasswordState.isWaitingTimer))
                        ? Color(0xff7FACFF)
                        : themeData.primaryColor)),
            onPressed: (isLoading || (resetPasswordState.isWaitingTimer))
                ? null
                : () => onPressed(),
            child: (isLoading)
                ? CircularProgressIndicator(color: Colors.white)
                : Text('Send code',
                    style: themeData.textTheme.bodyMedium
                        ?.copyWith(color: Colors.white))));
  }
}

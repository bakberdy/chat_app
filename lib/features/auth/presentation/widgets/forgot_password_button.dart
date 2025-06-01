import 'package:flutter/material.dart';

class ForgotPasswordButton extends StatelessWidget {
  const ForgotPasswordButton({super.key, required this.onPressed});
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Align(
      alignment: Alignment.centerLeft,
      child: TextButton(
        onPressed: onPressed,
        style: ButtonStyle(overlayColor: WidgetStateColor.transparent),
        child: Text(
          'Forgot password?',
          style: themeData.textTheme.bodySmall?.copyWith(
              height: 1.5,
              fontSize: 12,
              decoration: TextDecoration.underline,
              decorationColor: themeData.textTheme.bodyLarge?.color),
        ),
      ),
    );
  }
}

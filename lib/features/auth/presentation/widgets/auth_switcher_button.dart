import 'package:flutter/material.dart';

class AuthSwitcherButton extends StatelessWidget {
  const AuthSwitcherButton(
      {super.key, required this.onPressed, required this.title});
  final VoidCallback onPressed;
  final String title;

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return TextButton(
        onPressed: onPressed,
        child: Text(
          title,
          style: themeData.textTheme.bodyMedium?.copyWith(
              color: themeData.primaryColor, fontWeight: FontWeight.w600),
        ));
  }
}

import 'package:flutter/material.dart';

class AppLogoType extends StatelessWidget {
  const AppLogoType({
    super.key,
    this.fontSize = 40,
  });
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return RichText(
        text: TextSpan(
            style: themeData.textTheme.bodyMedium
                ?.copyWith(fontSize: fontSize, fontWeight: FontWeight.w700),
            children: [
          TextSpan(text: 'Talky'),
          TextSpan(text: '.', style: TextStyle(color: themeData.primaryColor))
        ]));
  }
}

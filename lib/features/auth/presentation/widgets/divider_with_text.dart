import 'package:flutter/material.dart';

class DividerWithText extends StatelessWidget {
  const DividerWithText({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
            width: MediaQuery.of(context).size.width * 0.28,
            child: Divider(
              thickness: 1,
              color: themeData.canvasColor,
            )),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Text(
            text,
            style: themeData.textTheme.bodyMedium
                ?.copyWith(color: themeData.canvasColor, height: 1),
          ),
        ),
        SizedBox(
            width: MediaQuery.of(context).size.width * 0.28,
            child: Divider(
              thickness: 1,
              color: themeData.canvasColor,
            )),
      ],
    );
  }
}

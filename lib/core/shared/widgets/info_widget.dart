import 'package:flutter/material.dart';

class InfoWidget extends StatelessWidget {
  const InfoWidget({super.key, this.imagePath, this.title, this.subtitle});
  final String? imagePath;
  final String? title;
  final String? subtitle;

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Column(
      children: [
        imagePath != null
            ? Image.asset(
                imagePath!,
                height: 200,
                width: 200,
              )
            : SizedBox(),
        title != null
            ? Text(
                title!,
                style: themeData.textTheme.bodyLarge
                    ?.copyWith(fontWeight: FontWeight.w600),
              )
            : SizedBox(),
        SizedBox(
          height: 5,
        ),
        subtitle != null
            ? Text(
                subtitle!,
                style: themeData.textTheme.bodyMedium
                    ?.copyWith(color: themeData.canvasColor),
              )
            : SizedBox(),
      ],
    );
  }
}

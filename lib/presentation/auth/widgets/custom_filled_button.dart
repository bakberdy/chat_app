
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomFilledButton extends StatelessWidget {
  const CustomFilledButton({
    super.key,
    required this.title,
    this.svgIconPath,
    required this.onPressed,
    required this.backgroundColor,
    this.withShadow = true, 
    this.titleColor
  });

  final String title;
  final String? svgIconPath;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final bool withShadow;
  final Color? titleColor;

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return SizedBox(
      height: 60,
      child: FilledButton(
          style: ButtonStyle(
              elevation: WidgetStatePropertyAll(withShadow ? 6 : 0),
              shadowColor: WidgetStatePropertyAll(Colors.black.withAlpha(50)),
              backgroundColor: WidgetStatePropertyAll(backgroundColor)),
          onPressed: onPressed,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              svgIconPath != null ? SvgPicture.asset(svgIconPath!) : SizedBox(),
              Text(
                title,
                style: themeData.textTheme.bodyMedium?.copyWith(color: titleColor),
              ),
              SizedBox()
            ],
          )),
    );
  }
}

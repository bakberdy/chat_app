import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomFilledButton extends StatelessWidget {
  const CustomFilledButton(
      {super.key,
      required this.title,
      this.svgIconPath,
      required this.onPressed,
      required this.backgroundColor,
      this.withShadow = true,
      this.titleColor = const Color(0xff243443),
      this.isLoading = false,
      this.borderColor});

  final String title;
  final String? svgIconPath;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final bool withShadow;
  final Color titleColor;
  final bool isLoading;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return SizedBox(
      height: 60,
      child: FilledButton(
          style: ButtonStyle(
              shape: borderColor == null
                  ? null
                  : WidgetStatePropertyAll(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide(width: 1, color: borderColor!))),
              elevation: WidgetStatePropertyAll(withShadow ? 6 : 0),
              overlayColor: WidgetStateProperty.resolveWith(
                (Set<WidgetState> states) {
                  if (states.contains(WidgetState.pressed)) {
                    return titleColor.withAlpha(25);
                  }
                  return null;
                },
              ),
              shadowColor: WidgetStatePropertyAll(Colors.black.withAlpha(50)),
              backgroundColor: WidgetStatePropertyAll(
                  isLoading ? Color(0xff7FACFF) : backgroundColor)),
          onPressed: isLoading ? null : onPressed,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              isLoading
                  ? SizedBox()
                  : svgIconPath != null
                      ? SvgPicture.asset(svgIconPath!)
                      : SizedBox(),
              isLoading
                  ? CircularProgressIndicator(
                      color: titleColor,
                    )
                  : Text(
                      title,
                      style: themeData.textTheme.bodyMedium
                          ?.copyWith(color: titleColor),
                    ),
              SizedBox()
            ],
          )),
    );
  }
}

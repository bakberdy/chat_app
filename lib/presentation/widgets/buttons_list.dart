import 'package:flutter/material.dart';

class ButtonDetails {
  final String title;
  final Widget? prefixIcon;
  final bool showSuffixArrow;
  final VoidCallback onTap;
  final TextStyle? titleStyle;

  const ButtonDetails(
      {required this.onTap,
      this.titleStyle,
      required this.title,
      required this.prefixIcon,
      this.showSuffixArrow = true});
}

class ButtonsList extends StatelessWidget {
  const ButtonsList({
    super.key,
    required this.children,
  });

  final List<ButtonDetails> children;

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [BoxShadow(blurRadius: 5, color: Colors.black12)]),
      child: ListView.separated(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            final child = children[index];
            return Material(
              color: Colors.white,
              child: InkWell(
                overlayColor: WidgetStatePropertyAll(Colors.grey.withAlpha(36),),
                onTap: child.onTap,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 12),
                  child: Row(
                    children: [
                      child.prefixIcon != null
                          ? child.prefixIcon!
                          : SizedBox.shrink(),
                      SizedBox(width: 10),
                      Expanded(
                          child: Text(
                        child.title,
                        style:
                            child.titleStyle ?? themeData.textTheme.bodyMedium,
                      )),
                      child.showSuffixArrow
                          ? Icon(
                              Icons.arrow_forward_ios_rounded,
                              size: 20,
                              color: themeData.canvasColor,
                            )
                          : SizedBox.shrink()
                    ],
                  ),
                ),
              ),
            );
          },
          separatorBuilder: (context, index) => Divider(
            height: 1,
                thickness: 1,
                color: Colors.black12,
              ),
          itemCount: children.length),
    );
  }
}
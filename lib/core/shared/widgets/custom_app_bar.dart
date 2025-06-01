import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    required this.pageContext,
    this.onBackTap,
    this.title,
    this.actions,
    this.height = 50,
  });
  final BuildContext pageContext;
  final Function? onBackTap;
  final String? title;
  final List<Widget>? actions;
  final double height;

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(height);
}

class _CustomAppBarState extends State<CustomAppBar> {
  bool isButtonTapped = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return AppBar(
      shadowColor: theme.hintColor.withAlpha(30),
      actions: widget.actions,
      title: widget.title != null
          ? Text(
              widget.title!,
              style: theme.textTheme.bodyMedium
                  ?.copyWith(fontWeight: FontWeight.w700),
            )
          : null,
      scrolledUnderElevation: 10,
      backgroundColor: Colors.white,
      leadingWidth: 85,
      elevation: 10,
      leading: context.canPop()
          ? Padding(
              padding: const EdgeInsets.all(10),
              child: InkWell(
                  onHighlightChanged: (flag) {
                    setState(() {
                      isButtonTapped = flag;
                    });
                  },
                  borderRadius: BorderRadius.circular(20),
                  splashColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () {
                    if (widget.onBackTap != null) {
                      widget.onBackTap!();
                      return;
                    }
                    if (GoRouter.of(widget.pageContext).canPop()) {
                      GoRouter.of(widget.pageContext).pop();
                    }
                  },
                  child: RepaintBoundary(
                    child: AnimatedPadding(
                      padding:
                          isButtonTapped ? EdgeInsets.all(5) : EdgeInsets.zero,
                      duration: Duration(milliseconds: 200),
                      child: SvgPicture.asset(
                        'lib/assets/icons/back_button_icon.svg',
                      ),
                    ),
                  )),
            )
          : null,
    );
  }
}

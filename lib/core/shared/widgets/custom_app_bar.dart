import 'package:chat_app/injection/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:talker_flutter/talker_flutter.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    required this.pageContext,
    this.onBackTap,
  });
  final BuildContext pageContext;
  final Function? onBackTap;

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(70);
}

class _CustomAppBarState extends State<CustomAppBar> {
  bool isButtonTapped = false;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      scrolledUnderElevation: 0,
      backgroundColor: Colors.white,
      leadingWidth: 85,
      elevation: 0,
      leading: Padding(
        padding: const EdgeInsets.all(10),
        child: InkWell(
            onHighlightChanged: (flag) {
              sl<Talker>().info(flag);
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
                padding: isButtonTapped ? EdgeInsets.all(5) : EdgeInsets.zero,
                duration: Duration(milliseconds: 200),
                child: SvgPicture.asset(
                  'lib/assets/icons/back_button_icon.svg',
                ),
              ),
            )),
      ),
    );
  }
}

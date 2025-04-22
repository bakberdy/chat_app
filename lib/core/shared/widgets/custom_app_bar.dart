import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key, required this.pageContext,
  });
  final BuildContext pageContext;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      scrolledUnderElevation: 0,
      backgroundColor: Colors.white,
      leadingWidth: 85,
      elevation: 0,
      leading: InkWell(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          hoverColor: Colors.transparent,
          onTap: () {
            if (GoRouter.of(pageContext).canPop()) {
              GoRouter.of(pageContext).pop();
            }
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: SvgPicture.asset(
              height: 50,
              width: 80,
              'lib/assets/icons/back_button_icon.svg',
            ),
          )),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(70);
}

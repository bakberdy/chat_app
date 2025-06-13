import 'package:chat_app/core/shared/widgets/custom_search_bar.dart';
import 'package:chat_app/core/core.dart';
import 'package:chat_app/core/theme/app_text_theme.dart';
import 'package:flutter/material.dart';

class HomeAppBarBottom extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBarBottom({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        SizedBox(height: 10),
        Text('Welcome, Bakberdi', style: AppTextTheme.h4),
        SizedBox(height: 10),
        CustomSearchBar(),
        SizedBox(height: 10),
      ]),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(80);
}

import 'package:chat_app/core/theme/app_colors.dart';
import 'package:chat_app/core/theme/app_text_theme.dart';
import 'package:flutter/material.dart';

class DividerWithText extends StatelessWidget {
  const DividerWithText({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
            width: MediaQuery.of(context).size.width * 0.28,
            child: Divider(
              thickness: 1,
              color: AppColors.grey,
            )),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Text(
            text,
            style: AppTextTheme.bodyMedium
                .copyWith(color: AppColors.grey, height: 1),
          ),
        ),
        SizedBox(
            width: MediaQuery.of(context).size.width * 0.28,
            child: Divider(
              thickness: 1,
              color: AppColors.grey,
            )),
      ],
    );
  }
}

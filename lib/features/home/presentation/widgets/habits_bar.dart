import 'package:chat_app/core/theme/app_colors.dart';
import 'package:chat_app/core/theme/app_text_theme.dart';
import 'package:flutter/material.dart';

class HabitsBar extends StatelessWidget {
  const HabitsBar({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SizedBox(height: 10),
            Text(title, style: AppTextTheme.h4),
          ]),
        ),
        SizedBox(
          height: 220,
          child: ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: 20),
            scrollDirection: Axis.horizontal,
            itemCount: 8,
            itemBuilder: (index, context) => Container(
              width: 150,
              margin: EdgeInsets.symmetric(vertical: 10),
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(2, 2),
                        blurRadius: 10,
                        color: AppColors.grey.withAlpha(40))
                  ]),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 140,
                    child: Image.network(
                      "https://download.samplelib.com/png/sample-blue-400x300.png",
                      fit: BoxFit.cover,
                    ),
                  )
                ],
              ),
            ),
            separatorBuilder: (BuildContext context, int index) =>
                SizedBox(width: 10),
          ),
        )
      ],
    );
  }
}

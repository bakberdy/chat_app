import 'package:chat_app/core/theme/app_colors.dart';
import 'package:chat_app/core/theme/app_text_theme.dart';
import 'package:flutter/material.dart';

class DailyHabitCard extends StatelessWidget {
  const DailyHabitCard({
    super.key,
    required this.index,
  });
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: AppColors.primary.withAlpha(50),
        borderRadius: index == 0
            ? BorderRadius.vertical(top: Radius.circular(12))
            : index == 2
                ? BorderRadius.vertical(bottom: Radius.circular(12))
                : BorderRadius.zero,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          SizedBox(width: 5),
          SizedBox(
            height: 50,
            width: 50,
            child: Image.network(
              "https://cdn-icons-png.flaticon.com/512/728/728093.png",
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 5),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Drink water after wake up',
                      style: AppTextTheme.bodySmall
                          .copyWith(fontWeight: FontWeight.w600)),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Icon(
                        Icons.timer_outlined,
                        size: 15,
                      ),
                      SizedBox(width: 3),
                      Text('10 min', style: AppTextTheme.bodySmall)
                    ],
                  )
                ],
              ),
            ),
          ),
          Checkbox(
            value: index % 2 == 0,
            onChanged: (value) {},
            side: BorderSide.none,
            fillColor: WidgetStatePropertyAll(AppColors.primary),
          ),
          SizedBox(width: 5)
        ],
      ),
    );
  }
}

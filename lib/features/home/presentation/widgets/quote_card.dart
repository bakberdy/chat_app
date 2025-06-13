import 'package:chat_app/core/theme/app_text_theme.dart';
import 'package:flutter/material.dart';

class QuoteCard extends StatelessWidget {
  const QuoteCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        SizedBox(height: 10),
        Text('Daily motivation', style: AppTextTheme.h4),
        SizedBox(height: 10),
        Container(
            width: double.infinity,
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.pink[50]),
            child: Column(
              children: [
                Text(
                  'The only limit to our realization of tomorrow will be our doubts of today.',
                  style: AppTextTheme.bodySmall.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    'Author: Abay Kunanbayev',
                    style: AppTextTheme.bodySmall.copyWith(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ))
      ]),
    );
  }
}

import 'package:chat_app/core/theme/app_colors.dart';
import 'package:chat_app/core/theme/app_text_theme.dart';
import 'package:flutter/material.dart';
import 'package:page_view_dot_indicator/page_view_dot_indicator.dart';

class RecomendationBar extends StatefulWidget {
  const RecomendationBar({super.key});
  @override
  State<RecomendationBar> createState() => _RecomendationBarState();
}

class _RecomendationBarState extends State<RecomendationBar> {
  int _currentPage = 0;
  final int _count = 3;
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
            Text('News', style: AppTextTheme.h4),
          ]),
        ),
        SizedBox(
          height: 180,
          child: PageView.builder(
            itemCount: _count,
            onPageChanged: (value) {
              _currentPage = value;
              setState(() {});
            },
            itemBuilder: (context, index) => Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              height: 180,
              width: double.infinity,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                    offset: Offset(2, 2),
                    blurRadius: 10,
                    color: AppColors.grey.withAlpha(40))
              ], borderRadius: BorderRadius.circular(12), color: Colors.pink),
              child: Text('Some article'),
            ),
          ),
        ),
        Center(
            child: PageViewDotIndicator(
                size: Size(10, 10),
                unselectedSize: Size(8, 8),
                boxShape: BoxShape.circle,
                currentItem: _currentPage,
                count: _count,
                unselectedColor: AppColors.grey,
                selectedColor: AppColors.primary))
      ],
    );
  }
}

import 'package:chat_app/core/core.dart';
import 'package:chat_app/core/shared/widgets/custom_app_bar.dart';
import 'package:chat_app/core/theme/app_colors.dart';
import 'package:chat_app/core/theme/app_text_theme.dart';
import 'package:chat_app/core/shared/widgets/daily_habit_card.dart';
import 'package:chat_app/features/home/presentation/widgets/habits_bar.dart';
import 'package:chat_app/features/home/presentation/widgets/home_app_bar_bottom.dart';
import 'package:chat_app/features/home/presentation/widgets/quote_card.dart';
import 'package:chat_app/features/home/presentation/widgets/recomendation_bar.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:page_view_dot_indicator/page_view_dot_indicator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              snap: true,
              floating: true,
              stretch: false,
              title: CustomAppBar(
                pageContext: context,
                title: 'Shift',
              ),
              bottom: HomeAppBarBottom(),
            ),
            SliverToBoxAdapter(
              child: QuoteCard(),
            ),
            SliverToBoxAdapter(child: RecomendationBar()),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10),
                      Text('Your today\'s plan', style: AppTextTheme.h4),
                      SizedBox(height: 10),
                    ]),
              ),
            ),
            SliverList.separated(
              separatorBuilder: (context, index) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Divider(
                  height: 1,
                  color: AppColors.white,
                ),
              ),
              itemCount: 3,
              itemBuilder: (context, index) {
                return DailyHabitCard(
                  index: index,
                );
              },
            ),
            SliverToBoxAdapter(child: HabitsBar(title: 'Education')),
            SliverToBoxAdapter(child: HabitsBar(title: 'Life')),
            SliverToBoxAdapter(child: HabitsBar(title: 'Sport')),
          ],
        ),
      ),
    );
  }
}

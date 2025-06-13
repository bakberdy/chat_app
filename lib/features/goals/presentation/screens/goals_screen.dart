import 'package:chat_app/core/core.dart';
import 'package:chat_app/core/shared/widgets/daily_habit_card.dart';
import 'package:chat_app/core/theme/app_colors.dart';
import 'package:chat_app/core/theme/app_text_theme.dart';
import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';

class GoalsScreen extends StatefulWidget {
  const GoalsScreen({super.key});

  @override
  State<GoalsScreen> createState() => _GoalsScreenState();
}

class _GoalsScreenState extends State<GoalsScreen> {
  DateTime _selectedDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: CustomAppBar(pageContext: context, title: 'Goals'),
            // bottom: GoalsScreenBottomAppBar(),
          ),
          SliverToBoxAdapter(
            child: Theme(
              data: ThemeData(
                  colorScheme:
                      ColorScheme.fromSwatch(primarySwatch: Colors.blue)),
              child: EasyDateTimeLinePicker(
                firstDate: DateTime(2025, 6, 13),
                lastDate: DateTime(2030, 3, 18),
                focusedDate: _selectedDate,
                currentDate: DateTime.now(),
                onDateChange: (date) {
                  _selectedDate = date;
                  setState(() {});
                },
              ),
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: 10)),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10),
                    Text(_textOfTheDay(_selectedDate), style: AppTextTheme.h4),
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
        ],
      )),
    );
  }

  String _textOfTheDay(DateTime date) {
    if (isSameDate(date, DateTime.now())) {
      return "Your today's plan";
    } else if (isSameDate(date, DateTime.now().subtract(Duration(days: 1)))) {
      return "Your yesterday plan";
    } else if (isSameDate(date, DateTime.now().add(Duration(days: 1)))) {
      return "Your tomorrow plan";
    } else {
      return 'Your plan of ${date.day} ${_monthName(date.month)}';
    }
  }

  // Helper to compare only date part
  bool isSameDate(DateTime a, DateTime b) {
    return a.year == b.year && a.month == b.month && a.day == b.day;
  }

  // Helper to get month name
  String _monthName(int month) {
    const months = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December'
    ];
    return months[month - 1];
  }
}

// class GoalsScreenBottomAppBar extends StatelessWidget
//     implements PreferredSizeWidget {
//   const GoalsScreenBottomAppBar({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//         height: 180,
//         child: );
//   }

//   @override
//   Size get preferredSize => Size.fromHeight(180);
// }

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class BottomNavigationBarPage extends StatefulWidget {
  const BottomNavigationBarPage({super.key, required this.navigationShell});
  final StatefulNavigationShell navigationShell;

  @override
  State<BottomNavigationBarPage> createState() =>
      _BottomNavigationBarPageState();
}

class _BottomNavigationBarPageState extends State<BottomNavigationBarPage> {
  late final ValueNotifier<int> _currentIndexNotifier;
  // late final List<GlobalKey<NavigatorState>> _navKeys;

  @override
  void initState() {
    _currentIndexNotifier = ValueNotifier(1);
    super.initState();
  }

  void _goBranch(int index) {
    widget.navigationShell.goBranch(
      index,
      initialLocation: index == widget.navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return ValueListenableBuilder<int>(
        valueListenable: _currentIndexNotifier,
        builder: (context, currentIndex, _) {
          return Scaffold(
            body: widget.navigationShell,
            bottomNavigationBar: SafeArea(
              child: Container(
                height: 65,
                decoration: BoxDecoration(
                    border: Border(
                        top: BorderSide(width: 1, color: Colors.grey[300]!))),
                child: Theme(
                  data: Theme.of(context).copyWith(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                  ),
                  child: BottomNavigationBar(
                      elevation: 0,
                      onTap: (value) {
                        _currentIndexNotifier.value = value;
                        _goBranch(value);
                      },
                      currentIndex: currentIndex,
                      selectedItemColor: themeData.primaryColor,
                      unselectedItemColor: themeData.canvasColor,
                      backgroundColor: Colors.white,
                      selectedLabelStyle: themeData.textTheme.bodySmall
                          ?.copyWith(
                              color: themeData.primaryColor, fontSize: 12),
                      unselectedLabelStyle:
                          themeData.textTheme.bodySmall?.copyWith(fontSize: 12),
                      items: [
                        _navigationBarItem(currentIndex, themeData, 'Home',
                            'lib/assets/icons/home.png', 0),
                        _navigationBarItem(currentIndex, themeData, 'Goals',
                            'lib/assets/icons/goals.png', 1),
                        _navigationBarItem(currentIndex, themeData, 'Settings',
                            'lib/assets/icons/settings.png', 2),
                      ]),
                ),
              ),
            ),
          );
        });
  }

  BottomNavigationBarItem _navigationBarItem(int currentIndex,
      ThemeData themeData, String label, String svgIconPath, int index) {
    return BottomNavigationBarItem(
        icon: SizedBox(
          height: 25,
          width: 25,
          child: Image.asset(
            svgIconPath,
            color: currentIndex == index
                ? themeData.primaryColor
                : themeData.canvasColor,
          ),
        ),
        label: label);
  }
}

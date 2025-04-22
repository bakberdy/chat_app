import 'package:chat_app/features/chats_and_calls/presentation/screens/chats_and_calls_page.dart';
import 'package:chat_app/features/users/presentation/screens/users_page.dart';
import 'package:chat_app/core/error/pages/page_not_found.dart';
import 'package:chat_app/features/settings/profile/presentation/screens/profile_page.dart';
import 'package:chat_app/features/settings/presentation/screens/settings_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BottomNavigationBarPage extends StatefulWidget {
  const BottomNavigationBarPage({super.key});

  @override
  State<BottomNavigationBarPage> createState() =>
      _BottomNavigationBarPageState();
}

class _BottomNavigationBarPageState extends State<BottomNavigationBarPage> {
  late final ValueNotifier<int> _currentIndexNotifier;
  late final List<GlobalKey<NavigatorState>> _navKeys;

  @override
  void initState() {
    _currentIndexNotifier = ValueNotifier(0);
    _navKeys = [
      GlobalKey<NavigatorState>(),
      GlobalKey<NavigatorState>(),
      GlobalKey<NavigatorState>()
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return ValueListenableBuilder<int>(
        valueListenable: _currentIndexNotifier,
        builder: (context, currentIndex, _) {
          return Scaffold(
            body: IndexedStack(
              index: currentIndex,
              children: [
                _buildFriendsNavigator(_navKeys[0]),
                _buildChatsNavigator(_navKeys[1]),
                _buildSettingsNavigator(_navKeys[2]),
              ],
            ),
            bottomNavigationBar: Container(
              height: 65,
              decoration: BoxDecoration(
                border: Border(top: BorderSide(width: 1, color: Colors.grey[300]!))
              ),
              child: Theme(
                data: Theme.of(context).copyWith(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                ),
                child: BottomNavigationBar(
                    elevation: 0,
                    onTap: (value) {
                      if (value == currentIndex) {
                        _navKeys[value]
                            .currentState
                            ?.popUntil((route) => route.isFirst);
                      } else {
                        _currentIndexNotifier.value = value;
                      }
                    },
                    currentIndex: currentIndex,
                    selectedItemColor: themeData.primaryColor,
                    unselectedItemColor: themeData.canvasColor,
                    backgroundColor: Colors.white,
                    selectedLabelStyle: themeData.textTheme.bodySmall
                        ?.copyWith(color: themeData.primaryColor, fontSize: 12),
                    unselectedLabelStyle:
                        themeData.textTheme.bodySmall?.copyWith(fontSize: 12),
                    items: [
                      BottomNavigationBarItem(
                          icon: SvgPicture.asset(
                            'lib/assets/icons/friends.svg',
                            colorFilter: ColorFilter.mode(
                                currentIndex == 0
                                    ? themeData.primaryColor
                                    : themeData.canvasColor,
                                BlendMode.srcIn),
                          ),
                          label: 'Friends'),
                      BottomNavigationBarItem(
                          icon: SvgPicture.asset(
                            'lib/assets/icons/message.svg',
                            colorFilter: ColorFilter.mode(
                                currentIndex == 1
                                    ? themeData.primaryColor
                                    : themeData.canvasColor,
                                BlendMode.srcIn),
                          ),
                          label: 'Chats'),
                      BottomNavigationBarItem(
                          icon: SvgPicture.asset(
                            'lib/assets/icons/settings.svg',
                            colorFilter: ColorFilter.mode(
                                currentIndex == 2
                                    ? themeData.primaryColor
                                    : themeData.canvasColor,
                                BlendMode.srcIn),
                          ),
                          label: 'Settings'),
                    ]),
              ),
            ),
          );
        });
  }

  Widget _buildFriendsNavigator(GlobalKey<NavigatorState> key) {
    return Navigator(
      key: key,
      initialRoute: '/',
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/':
            return MaterialPageRoute(builder: (context) => UsersPage());
          case '/profile':
            return MaterialPageRoute(builder: (context) => ProfilePage(userId: settings.arguments as String?));
          default:
            return MaterialPageRoute(builder: (context) => PageNotFound());
        }
      },
    );
  }

  Widget _buildChatsNavigator(GlobalKey<NavigatorState> key) {
    return Navigator(
      key: key,
      initialRoute: '/',
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/':
            return MaterialPageRoute(builder: (context) => ChatsAndCalls());
          default:
            return MaterialPageRoute(builder: (context) => PageNotFound());
        }
      },
    );
  }

  Widget _buildSettingsNavigator(GlobalKey<NavigatorState> key) {
    return Navigator(
      key: key,
      initialRoute: '/',
      onGenerateRoute: (settings) {
        final String? userId = settings.arguments as String?;
        switch (settings.name) {
          case '/':
            return MaterialPageRoute(builder: (context) => SettingsPage());
          case '/profile':
            return MaterialPageRoute(
                builder: (context) => ProfilePage(userId: userId));

          default:
            return MaterialPageRoute(builder: (context) => PageNotFound());
        }
      },
    );
  }
}

part of 'routing.dart';

class AppRoutes {
  ///branches for bottom navigation bar

  static StatefulShellBranch settingsBranch(
          {required TalkerRouteObserver observer,
          required GlobalKey<NavigatorState> key}) =>
      StatefulShellBranch(
        navigatorKey: key,
        observers: [observer],
        routes: [
          GoRoute(
            name: 'settings',
            path: AppPaths.settings,
            builder: (context, state) => SettingsPage(),
          )
        ],
      );

  static StatefulShellBranch homeBranch(
          {required TalkerRouteObserver observer,
          required GlobalKey<NavigatorState> key}) =>
      StatefulShellBranch(
        navigatorKey: key,
        observers: [observer],
        routes: [
          GoRoute(
            name: 'home',
            path: AppPaths.home,
            builder: (context, state) => HomeScreen(),
          )
        ],
      );

  static StatefulShellBranch goalsBranch(
          {required TalkerRouteObserver observer,
          required GlobalKey<NavigatorState> key}) =>
      StatefulShellBranch(
        navigatorKey: key,
        observers: [observer],
        routes: [
          GoRoute(
            name: 'goals',
            path: AppPaths.goals,
            builder: (context, state) => GoalsScreen(),
          )
        ],
      );
}

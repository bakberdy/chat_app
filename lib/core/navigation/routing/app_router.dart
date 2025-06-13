part of 'routing.dart';

class AppRouter {
  final _rootKey = GlobalKey<NavigatorState>();
  final _shellNavigatorHome = GlobalKey<NavigatorState>();
  final _shellNavigatorSettings = GlobalKey<NavigatorState>();
  final _shellNavigatorGoals = GlobalKey<NavigatorState>();

  final Talker talker;

  AppRouter({
    required this.talker,
  });

  GoRouter get router => GoRouter(
        observers: [TalkerRouteObserver(talker)],
        navigatorKey: _rootKey,
        initialLocation: AppPaths.settings,
        routes: [
          _bottomNavShellRoute(
            branches: [
              AppRoutes.homeBranch(
                  observer: TalkerRouteObserver(talker),
                  key: _shellNavigatorHome),
              AppRoutes.goalsBranch(
                  observer: TalkerRouteObserver(talker),
                  key: _shellNavigatorGoals),
              AppRoutes.settingsBranch(
                  observer: TalkerRouteObserver(talker),
                  key: _shellNavigatorSettings),
            ],
          ),
        ],
        errorBuilder: (context, state) {
          return const PageNotFound();
        },
      );

  StatefulShellRoute _bottomNavShellRoute(
          {required List<StatefulShellBranch> branches}) =>
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) =>
            BottomNavigationBarPage(navigationShell: navigationShell),
        branches: branches,
      );
}

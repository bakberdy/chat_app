part of 'routing.dart';

class AppRouter {
  final _rootKey = GlobalKey<NavigatorState>();
  final _shellNavigatorUsers = GlobalKey<NavigatorState>();
  final _shellNavigatorSettings = GlobalKey<NavigatorState>();
  final _shellNavigatorChatsAndCalls = GlobalKey<NavigatorState>();

  final bool isAuthenticated;
  final Talker talker;

  AppRouter({
    required this.isAuthenticated,
    required this.talker,
  });

  GoRouter get router => GoRouter(
        observers: [TalkerRouteObserver(talker)],
        navigatorKey: _rootKey,
        initialLocation: AppPaths.chatsAndCalls,
        routes: [
          AppRoutes.authRoutes(_rootKey),
          _bottomNavShellRoute(
            branches: [
              AppRoutes.usersBranch(
                  observer: TalkerRouteObserver(talker),
                  key: _shellNavigatorUsers),
              AppRoutes.chatsAndCallsBranch(
                  observer: TalkerRouteObserver(talker),
                  key: _shellNavigatorChatsAndCalls),
              AppRoutes.settingsBranch(
                  observer: TalkerRouteObserver(talker),
                  key: _shellNavigatorSettings),
            ],
            isAuthenticated: isAuthenticated,
          ),
        ],
        errorBuilder: (context, state) {
          return const PageNotFound();
        },
      );

  StatefulShellRoute _bottomNavShellRoute(
          {required bool isAuthenticated,
          required List<StatefulShellBranch> branches}) =>
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) =>
            BottomNavigationBarPage(navigationShell: navigationShell),
        redirect: (context, state) {
          if (!isAuthenticated) {
            return AppPaths.auth;
          } else {
            return null;
          }
        },
        branches: branches,
      );
}

part of 'routing.dart';

class AppRoutes {
  ///auth routes
  static GoRoute authRoutes(GlobalKey<NavigatorState> key) => GoRoute(
          path: AppPaths.auth,
          builder: (context, state) => SignInSocial(),
          parentNavigatorKey: key,
          routes: [
            GoRoute(
                path: AppPaths.signIn,
                builder: (context, state) => SignInEmail(),
                routes: [
                  GoRoute(
                      path: AppPaths.resetPassword,
                      builder: (context, state) => ResetPasswordPage(
                          email: state.uri.queryParameters['email']))
                ]),
            GoRoute(
                path: AppPaths.signUp,
                builder: (context, state) => SignUpEmail()),
          ]);

  ///branches for bottom navigation bar
  ///

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
              routes: [
                GoRoute(
                    path: AppPaths.profile,
                    pageBuilder: (context, state) => SwipeablePage(
                        canOnlySwipeFromEdge: true,
                        builder: (context) => ProfilePage())),
              ]),
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

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
  static StatefulShellBranch usersBranch(
          {required TalkerRouteObserver observer,
          required GlobalKey<NavigatorState> key}) =>
      StatefulShellBranch(navigatorKey: key, observers: [
        observer
      ], routes: [
        GoRoute(
            path: AppPaths.users,
            builder: (context, state) => UsersPage(),
            routes: [
              // GoRoute(
              //     path: '${AppPaths.profile}/:user_id',
              //     pageBuilder: (context, state) => SwipeablePage(
              //         canOnlySwipeFromEdge: true,
              //         builder: (context) => ProfilePage(
              //             userId: state.pathParameters['user_id']))),
            ]),
      ]);

  static StatefulShellBranch chatsAndCallsBranch(
          {required TalkerRouteObserver observer,
          required GlobalKey<NavigatorState> key}) =>
      StatefulShellBranch(
        navigatorKey: key,
        observers: [observer],
        routes: [
          GoRoute(
            path: AppPaths.chatsAndCalls,
            builder: (context, state) => ChatsAndCalls(),
          ),
        ],
      );

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
}

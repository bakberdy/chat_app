import 'package:chat_app/core/navigation/page/bottom_navigation_bar_page.dart';
import 'package:chat_app/core/navigation/routing/app_paths.dart';
import 'package:chat_app/features/auth/presentation/screens/reset_password_page.dart';
import 'package:chat_app/features/auth/presentation/screens/sign_in_email_page.dart';
import 'package:chat_app/features/auth/presentation/screens/sign_in_social_page.dart';
import 'package:chat_app/features/auth/presentation/screens/sign_up_email_page.dart';
import 'package:chat_app/features/chats_and_calls/presentation/screens/chats_and_calls_page.dart';
import 'package:chat_app/features/settings/presentation/screens/settings_page.dart';
import 'package:chat_app/features/settings/profile/presentation/screens/profile_page.dart';
import 'package:chat_app/features/users/presentation/screens/users_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:swipeable_page_route/swipeable_page_route.dart';
import 'package:talker_flutter/talker_flutter.dart';

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
                      builder: (context, state) => ResetPassword(
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
              GoRoute(
                  path: '${AppPaths.profile}/:user_id',
                  pageBuilder: (context, state) => SwipeablePage(
                      canOnlySwipeFromEdge: true,
                      builder: (context) => ProfilePage(
                          userId: state.pathParameters['user_id']))),
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
                    path: '${AppPaths.profile}/:user_id',
                    pageBuilder: (context, state) => SwipeablePage(
                        canOnlySwipeFromEdge: true,
                        builder: (context) => ProfilePage(userId: 'me'))),
              ]),
        ],
      );
}

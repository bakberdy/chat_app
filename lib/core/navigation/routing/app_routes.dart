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

class AppRoutes {
  static final GlobalKey<NavigatorState> _rootKey = GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> _shellNavigatorFriends =
      GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> _shellNavigatorSettings =
      GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> _shellNavigatorChatsAndCalls =
      GlobalKey<NavigatorState>();
  static GlobalKey<NavigatorState> get rootKey => _rootKey;

  ///auth routes
  static GoRoute authRoute({required List<RouteBase> routes}) => GoRoute(
      path: AppPaths.auth,
      builder: (context, state) => SignInSocial(),
      parentNavigatorKey: _rootKey,
      routes: routes);

  static GoRoute signInRoute(List<RouteBase> routes) {
    return GoRoute(
        path: AppPaths.signIn,
        builder: (context, state) => SignInEmail(),
        routes: routes);
  }

  static GoRoute signUpRoute() {
    return GoRoute(
        path: AppPaths.signUp, builder: (context, state) => SignUpEmail(), routes: [
          GoRoute(path: '/sign_up_content',builder: (context, state) => SignInEmailContent(),)
        ]);
  }

  static GoRoute resetPasswordRoute() {
    return GoRoute(
        path: AppPaths.resetPassword,
        builder: (context, state) =>
            ResetPassword(email: state.uri.queryParameters['email']));
  }

  ///shell route for bottom navigation
  static StatefulShellRoute bottomNavShellRoute(
          {required bool isAuthorized,
          required List<StatefulShellBranch> branches}) =>
      StatefulShellRoute.indexedStack(
          builder: (context, state, navigationShell) =>
              BottomNavigationBarPage(navigationShell: navigationShell),
          redirect: (context, state) {
            if (!isAuthorized) {
              return AppPaths.auth;
            } else {
              return null;
            }
          },
          branches: branches);

  ///branches for bottom navigation bar
  static StatefulShellBranch usersBranch() {
    return StatefulShellBranch(navigatorKey: _shellNavigatorFriends, routes: [
      GoRoute(
          path: AppPaths.users,
          builder: (context, state) => UsersPage(),
          routes: [
            GoRoute(
                path: '${AppPaths.profile}/:user_id',
                // builder: (context, state) {
                //   final userId = state.pathParameters['user_id'];
                //   if(userId==null) return;
                //   return ProfilePage(userId: userId);
                // },
                pageBuilder: (context, state) => SwipeablePage(
                    canOnlySwipeFromEdge: true,
                    builder: (context) =>
                        ProfilePage(userId: state.pathParameters['user_id']))),
          ]),
    ]);
  }

  static StatefulShellBranch chatsAndCallsBranch() {
    return StatefulShellBranch(
        navigatorKey: _shellNavigatorChatsAndCalls,
        routes: [
          GoRoute(
            path: AppPaths.chatsAndCalls,
            builder: (context, state) => ChatsAndCalls(),
          ),
        ]);
  }

  static StatefulShellBranch settingsBranch() {
    return StatefulShellBranch(navigatorKey: _shellNavigatorSettings, routes: [
      GoRoute(
          name: 'settings',
          path: AppPaths.settings,
          builder: (context, state) => SettingsPage(),
          routes: [
            GoRoute(
                path: '${AppPaths.profile}/:user_id',
                pageBuilder: (context, state) => SwipeablePage(
                    canOnlySwipeFromEdge: true,
                    builder: (context) =>
                        ProfilePage(userId: 'me'))),
          ]),
    ]);
  }
}

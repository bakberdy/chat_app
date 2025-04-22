import 'package:chat_app/core/error/pages/page_not_found.dart';
import 'package:chat_app/core/navigation/page/bottom_navigation_bar_page.dart';
import 'package:chat_app/core/navigation/routing/routes.dart';
import 'package:chat_app/features/settings/presentation/screens/settings_page.dart';
import 'package:chat_app/features/settings/profile/presentation/screens/profile_page.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  final bool isAuthenticated;
  AppRouter(this.isAuthenticated);
  GoRouter get router => GoRouter(
        initialLocation: '/main',
        routes: [
          AppRoutes.authRoutes,
          ShellRoute(
              builder: (context, state, child) =>
                  BottomNavigationBarPage(child: child),
              redirect: (context, state) {
                if (!isAuthenticated) {
                  return '/auth';
                } else {
                  return null;
                }
              },
              routes: [
                GoRoute(
                    name: 'settings',
                    path: '/settings',
                    builder: (context, state) => SettingsPage(),
                    routes: [
                      GoRoute(
                          path: '/profile/:user_id',
                          name: 'profile',
                          builder: (context, state) =>
                              ProfilePage(userId: state.pathParameters['user_id']))
                    ]),
                    GoRoute(
                    name: 'settings',
                    path: '/settings',
                    builder: (context, state) => SettingsPage(),
                    routes: [
                      GoRoute(
                          path: '/profile/:user_id',
                          name: 'profile',
                          builder: (context, state) =>
                              ProfilePage(userId: state.pathParameters['user_id']))
                    ]),

              ]),
        ],
        errorBuilder: (context, state) {
          return const PageNotFound();
        },
      );
}

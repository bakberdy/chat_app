import 'package:chat_app/core/error/pages/page_not_found.dart';
import 'package:chat_app/core/navigation/routing/app_paths.dart';
import 'package:chat_app/core/navigation/routing/app_routes.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  final bool isAuthenticated;

  AppRouter(this.isAuthenticated);
  GoRouter get router => GoRouter(
        navigatorKey: AppRoutes.rootKey,
        initialLocation: AppPaths.chatsAndCalls,
        routes: [
          AppRoutes.authRoute(routes: [
            AppRoutes.signInRoute([AppRoutes.resetPasswordRoute()]),
            AppRoutes.signUpRoute(),
          ]),
          AppRoutes.bottomNavShellRoute(branches: [
            AppRoutes.usersBranch(),
            AppRoutes.chatsAndCallsBranch(),
            AppRoutes.settingsBranch(),
          ], isAuthorized: isAuthenticated),
        ],
        errorBuilder: (context, state) {
          return const PageNotFound();
        },
      );
}

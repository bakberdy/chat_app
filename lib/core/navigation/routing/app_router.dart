import 'package:chat_app/core/error/pages/page_not_found.dart';
import 'package:chat_app/core/navigation/page/bottom_navigation_bar_page.dart';
import 'package:chat_app/core/navigation/routing/routes.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  final bool isAuthenticated;
  AppRouter(this.isAuthenticated);
  GoRouter get router => GoRouter(
        initialLocation: '/main',
        routes: [
          AppRoutes.authRoutes,
          GoRoute(
              path: '/main',
              builder: (context, state) => BottomNavigationBarPage(),
              redirect: (context, state) {
                if (!isAuthenticated) {
                  return '/auth';
                } else {
                  return null;
                }
              }),
        ],
        errorBuilder: (context, state) {
          return const PageNotFound();
        },
      );
}

// class _AppRouterDelegate extends RouterDelegate<RouteSettings>
//     with ChangeNotifier, PopNavigatorRouterDelegateMixin<RouteSettings> {

//   @override
//   GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

//   @override
//   RouteSettings? get currentConfiguration => RouteSettings(name: '/auth');

//   @override
//   Future<void> setNewRoutePath(RouteSettings configuration) async {}

//   @override
//   Widget build(BuildContext context) {
//     return Navigator(
//       key: navigatorKey,
//       onGenerateRoute: _onGenerateRoute,
//     );
//   }

//   Route<dynamic> _onGenerateRoute(RouteSettings settings) {
//     final routeName = settings.name ?? '/auth';
//     switch (routeName) {
//       case '/':
//         return MaterialPageRoute(builder: (_) => SignInSocial());
//       case '/auth':
//         return MaterialPageRoute(builder: (_) => SignInSocial());
//       case '/auth/sign_in':
//         return MaterialPageRoute(builder: (_) => SignInEmail());
//       case '/auth/sign_in/forgot_password':
//         return MaterialPageRoute(
//             builder: (_) => ResetPassword(email: settings.arguments as String?));
//       case '/auth/sign_up':
//         return MaterialPageRoute(builder: (_) => SignUpEmail());
//       case '/main':
//         return MaterialPageRoute(builder: (_) => BottomNavigationBarPage());
//       default:
//         return MaterialPageRoute(builder: (_)=> PageNotFound());
//     }
//   }
// }

// class _AppRouteInformationParser extends RouteInformationParser<RouteSettings> {
//   @override
//   Future<RouteSettings> parseRouteInformation(RouteInformation routeInformation) async {
//     return RouteSettings(name: routeInformation.uri.path);
//   }

//   @override
//   RouteInformation? restoreRouteInformation(RouteSettings configuration) {
//     return RouteInformation(uri: Uri(path: configuration.name??'/'));
//   }
// }

import 'package:chat_app/features/auth/presentation/screens/reset_password_page.dart';
import 'package:chat_app/features/auth/presentation/screens/sign_in_email_page.dart';
import 'package:chat_app/features/auth/presentation/screens/sign_in_social_page.dart';
import 'package:chat_app/features/auth/presentation/screens/sign_up_email_page.dart';
import 'package:go_router/go_router.dart';

class AppRoutes {
  static GoRoute authRoutes = GoRoute(
      path: '/auth',
      builder: (context, state) => SignInSocial(),
      routes: [
        GoRoute(
            path: '/sign_in',
            builder: (context, state) => SignInEmail(),
            routes: [
              GoRoute(
                  name: 'forgot_password',
                  path: 'forgot_password',
                  builder: (context, state) =>
                      ResetPassword(email: state.uri.queryParameters['email'])),
            ]),
        GoRoute(path: '/sign_up', builder: (context, state) => SignUpEmail()),
      ]);
}

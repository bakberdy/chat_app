import 'package:chat_app/presentation/blocs/reset_password/reset_password_cubit.dart';
import 'package:chat_app/presentation/blocs/sign_in/sign_in_cubit.dart';
import 'package:chat_app/presentation/screens/bottom_navigation_bar_page.dart';
import 'package:chat_app/presentation/screens/chats_and_calls_page.dart';
import 'package:chat_app/presentation/screens/friends_page.dart';
import 'package:chat_app/presentation/screens/page_not_found.dart';
import 'package:chat_app/presentation/screens/profile_page.dart';
import 'package:chat_app/presentation/screens/reset_password_page.dart';
import 'package:chat_app/presentation/screens/settings_page.dart';
import 'package:chat_app/presentation/screens/sign_in_email_page.dart';
import 'package:chat_app/presentation/screens/sign_in_social_page.dart';
import 'package:chat_app/presentation/screens/sign_up_email_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ResetPasswordCubit>(
          create: (context) => ResetPasswordCubit(),
        ),
        BlocProvider<SignInCubit>(
          create: (context) => SignInCubit(),
        ),
      ],
      child: MaterialApp(
        title: 'Talky',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primaryColor: Color(0xff377DFF),
            scaffoldBackgroundColor: Colors.white,
            hintColor: Color(0xffAAB0B7),
            canvasColor: Color(0xff58616A),
            colorScheme: ColorScheme.fromSeed(seedColor: Color(0xff377DFF)),
            useMaterial3: true,
            textTheme: GoogleFonts.interTextTheme()
                .apply(
                  bodyColor: Color(0xff243443),
                  displayColor: Color(0xff243443),
                )
                .copyWith(
                  bodyMedium: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff243443)),
                  bodySmall: TextStyle(fontSize: 14, color: Color(0xff243443)),
                  bodyLarge: TextStyle(fontSize: 18, color: Color(0xff243443)),
                ),
            filledButtonTheme: FilledButtonThemeData(
                style: ButtonStyle(
                    shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)))))),
        onGenerateRoute: (RouteSettings settings) {
          final routeName = settings.name ?? '';
          switch (routeName) {
            case '/auth':
              return MaterialPageRoute(builder: (_) => SignInSocial());
            case '/auth/sign_in':
              return MaterialPageRoute(builder: (_) => SignInEmail());
            case '/auth/sign_in/forgot_password':
              return MaterialPageRoute(builder: (_) => ResetPassword(email: settings.arguments as String?));
            case '/auth/sign_up':
              return MaterialPageRoute(builder: (_) => SignUpEmail());
            case '/main':
              return MaterialPageRoute(
                  builder: (_) => BottomNavigationBarPage());
          }
        },
        initialRoute: '/auth',
      ),
    );
  }
}

import 'package:chat_app/presentation/auth/bloc/reset_password/reset_password_cubit.dart';
import 'package:chat_app/presentation/auth/screens/sign_in_social_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ResetPasswordCubit(),
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
        home: SignInSocial(),
      ),
    );
  }
}

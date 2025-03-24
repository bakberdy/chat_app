import 'package:chat_app/core/utils/validators.dart';
import 'package:chat_app/presentation/blocs/sign_in/sign_in_cubit.dart';
import 'package:chat_app/presentation/screens/bottom_navigation_bar_page.dart';
import 'package:chat_app/presentation/screens/reset_password_page.dart';
import 'package:chat_app/presentation/screens/sign_up_email_page.dart';
import 'package:chat_app/presentation/widgets/auth_input_field.dart';
import 'package:chat_app/presentation/widgets/custom_app_bar.dart';
import 'package:chat_app/presentation/widgets/custom_filled_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInEmail extends StatefulWidget {
  const SignInEmail({super.key});

  @override
  State<SignInEmail> createState() => _SignInEmailState();
}

class _SignInEmailState extends State<SignInEmail> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  void _onSubmit(ctx) {
    final email = _emailController.text;
    final password = _passwordController.text;

    if (_formKey.currentState!.validate()) {
      BlocProvider.of<SignInCubit>(ctx).signInWitEmail(email, password);
    }
  }

  void _onForgotPassword() {
    //go to page refresh password
    final email = _emailController.text;

    Navigator.pushNamed(context, '/auth/sign_in/forgot_password',
        arguments: email);
  }

  bool isValidEmail(String email) {
    final RegExp emailRegExp = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );
    return emailRegExp.hasMatch(email);
  }

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);

    return BlocListener<SignInCubit, SignInState>(
      listener: (context, state) {
        Navigator.pushNamedAndRemoveUntil(context, '/main', (route) => false);
      },
      child: Scaffold(
        appBar: CustomAppBar(),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 28),
            child: Column(
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                Center(
                  child: RichText(
                      text: TextSpan(
                          style: themeData.textTheme.bodyMedium?.copyWith(
                              fontSize: 40, fontWeight: FontWeight.w700),
                          children: [
                        TextSpan(text: 'Talky'),
                        TextSpan(
                            text: '.',
                            style: TextStyle(color: themeData.primaryColor))
                      ])),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                Text(
                  'Sign in with email',
                  style: themeData.textTheme.bodyLarge
                      ?.copyWith(fontWeight: FontWeight.w600),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.08),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      AuthInputField(
                        validator: validateEmail,
                        controller: _emailController,
                        hintText: 'Enter your email address',
                      ),
                      SizedBox(height: 15),
                      AuthInputField(
                        validator: validatePassword,
                        controller: _passwordController,
                        isPassword: true,
                        hintText: 'Enter your password',
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: TextButton(
                    onPressed: _onForgotPassword,
                    style:
                        ButtonStyle(overlayColor: WidgetStateColor.transparent),
                    child: Text(
                      'Forgot password?',
                      style: themeData.textTheme.bodySmall?.copyWith(
                          height: 1.5,
                          fontSize: 12,
                          decoration: TextDecoration.underline,
                          decorationColor:
                              themeData.textTheme.bodyLarge?.color),
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.20),
                SizedBox(
                    height: 55,
                    child: BlocBuilder<SignInCubit, SignInState>(
                      builder: (context, state) {
                        return CustomFilledButton(
                            titleColor: Colors.white,
                            isLoading: state is SignInLoading,
                            title: 'Sign in',
                            onPressed: () {
                              _onSubmit(context);
                            },
                            backgroundColor: themeData.primaryColor);
                      },
                    )),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Don't have an account?",
                  style: themeData.textTheme.bodySmall,
                ),
                TextButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/auth/sign_up');
                    },
                    child: Text(
                      'Sign up here',
                      style: themeData.textTheme.bodyMedium?.copyWith(
                          color: themeData.primaryColor,
                          fontWeight: FontWeight.w600),
                    )),
                SizedBox(
                  height: 30,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

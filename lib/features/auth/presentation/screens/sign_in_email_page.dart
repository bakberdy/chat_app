import 'package:chat_app/core/navigation/routing/app_paths.dart';
import 'package:chat_app/core/utils/validators.dart';
import 'package:chat_app/features/auth/domain/enitities/sign_in_with_email_entity.dart';
import 'package:chat_app/features/auth/presentation/blocs/sign_in/sign_in_cubit.dart';
import 'package:chat_app/features/auth/presentation/widgets/auth_input_field.dart';
import 'package:chat_app/core/shared/widgets/custom_app_bar.dart';
import 'package:chat_app/core/shared/widgets/custom_filled_button.dart';
import 'package:chat_app/injection/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SignInEmail extends StatelessWidget {
  const SignInEmail({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<SignInCubit>(),
      child: SignInEmailContent(),
    );
  }
}

class SignInEmailContent extends StatefulWidget {
  const SignInEmailContent({super.key});

  @override
  State<SignInEmailContent> createState() => _SignInEmailContentState();
}

class _SignInEmailContentState extends State<SignInEmailContent> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  late final SignInCubit _signInCubit;

  final _formKey = GlobalKey<FormState>();

  Future<void> _onLogin(ctx) async {
    final signInData = SignInWithEmailEntity(
        email: _emailController.text, password: _passwordController.text);

    if (_formKey.currentState!.validate()) {
      await _signInCubit.signInWitEmail(signInData);
    }
  }

  void _onForgotPassword() {
    final email = _emailController.text;
    context.push(
        '${AppPaths.auth}${AppPaths.signIn}${AppPaths.resetPassword}?email=$email');
  }

  @override
  void initState() {
    super.initState();
    _signInCubit = sl<SignInCubit>();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _signInCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);

    return Scaffold(
      appBar: CustomAppBar(
        pageContext: context,
      ),
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
                        decorationColor: themeData.textTheme.bodyLarge?.color),
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.20),
              SizedBox(
                  height: 55,
                  child: BlocBuilder<SignInCubit, SignInState>(
                    bloc: _signInCubit,
                    builder: (context, state) {
                      return CustomFilledButton(
                          titleColor: Colors.white,
                          isLoading: state is SignInLoading,
                          title: 'Sign in',
                          onPressed: () async {
                           await _onLogin(context);
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
                    context.replace('${AppPaths.auth}${AppPaths.signUp}');
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
    );
  }
}

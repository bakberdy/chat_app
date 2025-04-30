import 'package:chat_app/core/bloc/state_status.dart';
import 'package:chat_app/core/navigation/routing/app_paths.dart';
import 'package:chat_app/core/shared/widgets/app_logo_type.dart';
import 'package:chat_app/core/utils/error_toast.dart';
import 'package:chat_app/core/utils/validators.dart';
import 'package:chat_app/features/auth/presentation/blocs/auth/auth_bloc.dart';
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
    return BlocProvider<AuthBloc>.value(
      value: sl<AuthBloc>(),
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

  final _formKey = GlobalKey<FormState>();

  void _onLogin({required AuthBloc bloc}) {
    final email = _emailController.text;
    final password = _passwordController.text;

    if (_formKey.currentState!.validate()) {
      bloc.add(AuthEvent.signIn(email: email, password: password));
    }
  }

  void _onForgotPassword() {
    final email = _emailController.text;
    context.push(
        '${AppPaths.auth}${AppPaths.signIn}${AppPaths.resetPassword}?email=$email');
  }

  _goToSignUp(BuildContext context) {
    context.replace('${AppPaths.auth}${AppPaths.signUp}');
  }

  void _authBlocListener(BuildContext context, AuthState state) {
    if (state.resetPassword == ResetPasswordStatus.error) {
      showErrorToast(state.errorMessage ?? 'Неизвестная ошибка', context);
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    final AuthBloc authBloc = context.read<AuthBloc>();
    return BlocListener<AuthBloc, AuthState>(
      bloc: authBloc,
      listener: _authBlocListener,
      child: Scaffold(
        appBar: CustomAppBar(
          pageContext: context,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 28),
            child: Column(
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                Center(child: AppLogoType()),
                SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                Text('Sign in with email',
                    style: themeData.textTheme.bodyLarge
                        ?.copyWith(fontWeight: FontWeight.w600)),
                SizedBox(height: MediaQuery.of(context).size.height * 0.08),
                Form(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
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
                    child: BlocBuilder<AuthBloc, AuthState>(
                      bloc: authBloc,
                      builder: (context, state) {
                        return CustomFilledButton(
                            titleColor: Colors.white,
                            isLoading:
                                state.signInStatus == StateStatus.loading,
                            title: 'Sign in',
                            onPressed: () => _onLogin(bloc: authBloc),
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
                    onPressed: () => _goToSignUp(context),
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

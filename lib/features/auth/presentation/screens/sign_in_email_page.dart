import 'package:chat_app/core/core.dart';
import 'package:chat_app/core/utils/info_toast.dart';
import 'package:chat_app/features/auth/presentation/auth_bloc/auth_bloc.dart';
import 'package:chat_app/features/auth/presentation/widgets/widgets.dart';
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
  late final AuthBloc _authBloc;

  final _emailOrUsernameController = TextEditingController();
  final _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void didChangeDependencies() {
    _authBloc = context.read<AuthBloc>();
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _emailOrUsernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themeData = context.theme;
    return BlocListener<AuthBloc, AuthState>(
      bloc: _authBloc,
      listener: _authBlocListener,
      child: Scaffold(
        appBar: CustomAppBar(pageContext: context),
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
                  key: _formKey,
                  child: Column(
                    children: [
                      AuthInputField(
                        keyBoardType: TextInputType.emailAddress,
                        validator: validateEmail,
                        controller: _emailOrUsernameController,
                        hintText: 'Enter your email address',
                      ),
                      SizedBox(height: 15),
                      AuthInputField(
                        keyBoardType: TextInputType.visiblePassword,
                        validator: validatePassword,
                        controller: _passwordController,
                        isPassword: true,
                        hintText: 'Enter your password',
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                ForgotPasswordButton(onPressed: _onForgotPasswordPressed),
                SizedBox(height: MediaQuery.of(context).size.height * 0.20),
                SizedBox(
                    height: 55,
                    child: BlocBuilder<AuthBloc, AuthState>(
                      bloc: _authBloc,
                      builder: (context, state) {
                        return CustomFilledButton(
                            titleColor: Colors.white,
                            isLoading: state.status.isLoading,
                            title: 'Sign in',
                            onPressed: () => _onLoginPressed(bloc: _authBloc),
                            backgroundColor: themeData.primaryColor);
                      },
                    )),
                SizedBox(height: 20),
                Text(
                  "Don't have an account?",
                  style: themeData.textTheme.bodySmall,
                ),
                AuthSwitcherButton(
                  onPressed: () => _navigateToSignUp(context),
                  title: 'Sign up here',
                ),
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

  void _onLoginPressed({required AuthBloc bloc}) {
    final emailOrUsername = _emailOrUsernameController.text;
    final password = _passwordController.text;

    if (_formKey.currentState!.validate()) {
      bloc.add(AuthEvent.login(
        emailOrUsername: emailOrUsername,
        password: password,
      ));
    }
  }

  void _onForgotPasswordPressed() {
    final email = _emailOrUsernameController.text;
    context.push(
        '${AppPaths.auth}${AppPaths.signIn}${AppPaths.resetPassword}?email=$email');
  }

  _navigateToSignUp(BuildContext context) {
    context.replace('${AppPaths.auth}${AppPaths.signUp}');
  }

  void _authBlocListener(BuildContext context, AuthState state) {
    if (state.status.isError) {
      showErrorToast(
        context,
        message: state.message ?? 'Неизвестная ошибка',
      );
    } else if (state.status.isLoaded && state.message != null) {
      showInfoToast(context, message: state.message!);
    }
  }
}

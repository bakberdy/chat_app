import 'package:chat_app/features/auth/presentation/auth_bloc/auth_bloc.dart';
import 'package:chat_app/injection/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/core.dart';
import '../widgets/widgets.dart';

class SignUpEmail extends StatelessWidget {
  const SignUpEmail({super.key});

  @override
  Widget build(BuildContext context) {
    return SignUpEmailContent();
  }
}

class SignUpEmailContent extends StatefulWidget {
  const SignUpEmailContent({super.key});

  @override
  State<SignUpEmailContent> createState() => _SignUpEmailContentState();
}

class _SignUpEmailContentState extends State<SignUpEmailContent> {
  late final AuthBloc _authBloc;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _usernameController = TextEditingController();
  final _firstFormKey = GlobalKey<FormState>();
  final _secondFormKey = GlobalKey<FormState>();

  void _onNextPressed() {
    if (_firstFormKey.currentState?.validate() ?? false) {
      _authBloc.add(
          AuthEvent.changeRegisterStatus(status: RegistrationState.emailInput));
    }
  }

  void _register(context) {
    final email = _emailController.text.trim();
    final firstName = _firstNameController.text.trim();
    final lastName = _lastNameController.text.trim();
    final password = _passwordController.text.trim();
    final username = _usernameController.text.trim();

    if (_secondFormKey.currentState?.validate() ?? false) {
      _authBloc.add(AuthEvent.register(
          email: email,
          password: password,
          firstName: firstName,
          lastName: lastName,
          username: username));
    }
  }

  @override
  void initState() {
    super.initState();
    _authBloc = context.read<AuthBloc>();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _usernameController.dispose();
    super.dispose();
  }

  void _authBlocListener(BuildContext context, AuthState state) {
    // if (state.status.isError) {
    //   showErrorToast(message: state.message ?? 'Неизвестная ошибка', context);
    // } else if (state.status.isLoaded && state.message != null) {
    //   showInfoToast(context, message: state.message!);
    // }
  }

  @override
  Widget build(BuildContext context) {
    final themeData = context.theme;
    return BlocConsumer<AuthBloc, AuthState>(
      bloc: _authBloc,
      listener: _authBlocListener,
      builder: (context, state) => Scaffold(
        appBar: CustomAppBar(
          pageContext: context,
          onBackTap: () {
            if (state.registrationState.isEmailInput) {
              _authBloc.add(AuthEvent.changeRegisterStatus(
                  status: RegistrationState.nameInput));
            } else {
              GoRouter.of(context).pop();
            }
          },
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 28),
            child: Column(
              children: [
                SizedBox(height: context.mediaHeight * 0.02),
                AppLogoType(),
                SizedBox(height: context.mediaHeight * 0.05),
                Text('Sign up with email',
                    style: themeData.textTheme.bodyLarge
                        ?.copyWith(fontWeight: FontWeight.w600)),
                SizedBox(height: MediaQuery.of(context).size.height * 0.08),
                BlocBuilder<AuthBloc, AuthState>(
                  bloc: _authBloc,
                  builder: (context, state) {
                    switch (state.registrationState) {
                      case RegistrationState.nameInput:
                        return NamesInputForm(
                          formKey: _firstFormKey,
                          firstNameController: _firstNameController,
                          lastNameController: _lastNameController,
                        );
                      case RegistrationState.emailInput:
                        return EmailAndPasswordInputForm(
                            formKey: _secondFormKey,
                            emailController: _emailController,
                            passwordController: _passwordController,
                            usernameController: _usernameController,
                            confirmPasswordController:
                                _confirmPasswordController);
                    }
                  },
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.22),
                BlocBuilder<AuthBloc, AuthState>(
                  builder: (context, state) {
                    return RegisterButton(
                      onNextPressed: _onNextPressed,
                      onRegisterPressed: () => _register(context),
                      registrationState: state.registrationState,
                      bgColor: themeData.primaryColor,
                      isLoaging: state.status.isLoading,
                    );
                  },
                ),
                SizedBox(height: 20),
                Text('Already have an account?',
                    style: themeData.textTheme.bodySmall),
                AuthSwitcherButton(
                    onPressed: () => _navigateToSignInPage(context),
                    title: 'Sign in here'),
                SizedBox(height: 30)
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _navigateToSignInPage(BuildContext context) {
    context.replace('${AppPaths.auth}${AppPaths.signIn}');
  }
}

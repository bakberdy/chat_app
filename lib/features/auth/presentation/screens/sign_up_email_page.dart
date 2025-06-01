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
    return BlocProvider<AuthBloc>(
      create: (_) => sl<AuthBloc>(),
      child: SignUpEmailContent(),
    );
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
  final _firstFormKey = GlobalKey<FormState>();
  final _secondFormKey = GlobalKey<FormState>();

  void _onNextPressed() {
    if (_firstFormKey.currentState?.validate() ?? false) {
      _authBloc.add(AuthEvent.changeSignUpStatus(status: SignUpStatus.nameGot));
    }
  }

  void _register(context) {
    final email = _emailController.text.trim();
    final firstName = _firstNameController.text.trim();
    final lastName = _lastNameController.text.trim();
    final password = _passwordController.text.trim();

    if (_secondFormKey.currentState?.validate() ?? false) {
      _authBloc.add(AuthEvent.signUp(
          email: email,
          password: password,
          firstName: firstName,
          lastName: lastName));
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    _authBloc = context.read<AuthBloc>();
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    super.dispose();
  }

  void _authBlocListener(BuildContext context, AuthState state) {
    if (state.signUpStatus == SignUpStatus.error) {
      showErrorToast(state.errorMessage ?? 'Неизвестная ошибка', context);
    }
  }

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return BlocConsumer<AuthBloc, AuthState>(
      bloc: _authBloc,
      listener: _authBlocListener,
      builder: (context, state) => Scaffold(
        appBar: CustomAppBar(
          pageContext: context,
          onBackTap: () {
            if (state.signUpStatus != SignUpStatus.initial) {
              _authBloc.add(
                  AuthEvent.changeSignUpStatus(status: SignUpStatus.initial));
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
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                AppLogoType(),
                SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                Text(
                  'Sign up with email',
                  style: themeData.textTheme.bodyLarge
                      ?.copyWith(fontWeight: FontWeight.w600),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.08),
                BlocBuilder<AuthBloc, AuthState>(
                  bloc: _authBloc,
                  builder: (context, state) {
                    switch (state.signUpStatus) {
                      case SignUpStatus.initial:
                        return NamesInputForm(
                          formKey: _firstFormKey,
                          firstNameController: _firstNameController,
                          lastNameController: _lastNameController,
                        );
                      default:
                        return EmailAndPasswordInputForm(
                            formKey: _secondFormKey,
                            emailController: _emailController,
                            passwordController: _passwordController,
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
                      signUpStatus: state.signUpStatus,
                      bgColor: themeData.primaryColor,
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

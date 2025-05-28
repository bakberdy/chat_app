import 'package:chat_app/core/navigation/routing/app_paths.dart';
import 'package:chat_app/core/utils/error_toast.dart';
import 'package:chat_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:chat_app/features/auth/presentation/widgets/auth_input_field.dart';
import 'package:chat_app/core/shared/widgets/custom_app_bar.dart';
import 'package:chat_app/core/shared/widgets/custom_filled_button.dart';
import 'package:chat_app/injection/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

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
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();

  void _register(context, {required AuthState state, required AuthBloc bloc}) {
    final email = _emailController.text.trim();
    final firstName = _firstNameController.text.trim();
    final lastName = _lastNameController.text.trim();
    final password = _passwordController.text.trim();

    if (state.signUpStatus == SignUpStatus.initial) {
      bloc.add(AuthEvent.changeSignUpStatus(status: SignUpStatus.nameGot));
    } else if (state.signUpStatus == SignUpStatus.nameGot) {
      bloc.add(AuthEvent.signUp(
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
    final authBloc = context.read<AuthBloc>();
    return BlocListener<AuthBloc, AuthState>(
      bloc: authBloc,
      listener: _authBlocListener,
      child: Scaffold(
        appBar: CustomAppBar(pageContext: context),
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
                  'Sign up with email',
                  style: themeData.textTheme.bodyLarge
                      ?.copyWith(fontWeight: FontWeight.w600),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.08),
                Form(
                  // key: _formKey1,
                  child: BlocBuilder<AuthBloc, AuthState>(
                    bloc: authBloc,
                    builder: (context, state) {
                      ;
                      if (state.signUpStatus == SignUpStatus.initial) {
                        return _firstnameLastnameInput();
                      } else if (state.signUpStatus == SignUpStatus.nameGot) {
                        return _emailAndPasswordInput();
                      }
                      return SizedBox();
                    },
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.22),
                SizedBox(
                    height: 55,
                    child: BlocBuilder<AuthBloc, AuthState>(
                      builder: (context, state) {
                        return CustomFilledButton(
                            isLoading:
                                state.signUpStatus == SignUpStatus.loading,
                            titleColor: Colors.white,
                            title: (state.signUpStatus == SignUpStatus.initial)
                                ? "Next"
                                : 'Sign up',
                            onPressed: () => _register(context,
                                bloc: authBloc, state: state),
                            backgroundColor: themeData.primaryColor);
                      },
                    )),
                SizedBox(height: 20),
                Text('Already have an account?',
                    style: themeData.textTheme.bodySmall),
                TextButton(
                    onPressed: () {
                      context.replace('${AppPaths.auth}${AppPaths.signIn}');
                    },
                    child: Text(
                      'Sign in here',
                      style: themeData.textTheme.bodyMedium?.copyWith(
                          color: themeData.primaryColor,
                          fontWeight: FontWeight.w600),
                    )),
                SizedBox(height: 30)
              ],
            ),
          ),
        ),
      ),
    );
  }

  Column _firstnameLastnameInput() {
    return Column(
      children: [
        AuthInputField(
          // validator: validateName,
          controller: _firstNameController,
          hintText: 'Enter firstname',
        ),
        SizedBox(height: 15),
        AuthInputField(
          // validator: validateName,
          controller: _lastNameController,
          hintText: 'Enter lastname',
        ),
        SizedBox(
          height: 50,
        )
      ],
    );
  }

  Column _emailAndPasswordInput() {
    return Column(
      children: [
        AuthInputField(
          // validator: validateEmail,
          controller: _emailController,
          hintText: 'Enter your email address',
        ),
        SizedBox(height: 15),
        AuthInputField(
          // validator: validatePassword,
          controller: _passwordController,
          isPassword: true,
          hintText: 'Enter password',
        ),
        SizedBox(height: 15),
        AuthInputField(
          // validator: (value) =>
          //     validateConfirmPassword(value, _passwordController.text),
          controller: _confirmPasswordController,
          isPassword: true,
          hintText: 'Confirm password',
        ),
      ],
    );
  }
}

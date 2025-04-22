import 'package:chat_app/core/utils/validators.dart';
import 'package:chat_app/features/auth/presentation/blocs/sign_up/sign_up_cubit.dart';
import 'package:chat_app/features/auth/presentation/screens/sign_in_email_page.dart';
import 'package:chat_app/features/auth/presentation/widgets/auth_input_field.dart';
import 'package:chat_app/core/shared/widgets/custom_app_bar.dart';
import 'package:chat_app/core/shared/widgets/custom_filled_button.dart';
import 'package:chat_app/injection/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SignUpEmail extends StatefulWidget {
  const SignUpEmail({super.key});

  @override
  State<SignUpEmail> createState() => _SignUpEmailState();
}

class _SignUpEmailState extends State<SignUpEmail> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();

  final _formKey1 = GlobalKey<FormState>();

  late final SignUpCubit _signUpCubit;

  void _onSubmit(context, state) {
    final email = _emailController.text;
    final password = _passwordController.text;
    final confirmPassword = _confirmPasswordController.text;
    final firstName = _firstNameController.text;
    final lastName = _lastNameController.text;

    if (_formKey1.currentState!.validate()) {
      if (state is SignUpInitial) {
        _signUpCubit.addNameAndLastname();
      } else if (state is SignUpNameGot) {
        _signUpCubit.signUpWithEmailAndPassword();
      } else if (state is SignUpSuccess) {
        //Todo: send request to register
      }
    }
  }

  @override
  void initState() {
    _signUpCubit = sl<SignUpCubit>();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _signUpCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);

    return BlocProvider<SignUpCubit>.value(
      value: _signUpCubit,
      child: Scaffold(
        appBar: CustomAppBar(pageContext: context,),
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
                  key: _formKey1,
                  child: BlocBuilder<SignUpCubit, SignUpState>(
                    builder: (context, state) {
                      if (state is SignUpInitial) {
                        return _firstnameLastnameInput();
                      } else if (state is SignUpNameGot) {
                        return _emailAndPasswordInput();
                      }
                      return SizedBox();
                    },
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.22),
                SizedBox(
                    height: 55,
                    child: BlocBuilder<SignUpCubit, SignUpState>(
                      builder: (context, state) {
                        return CustomFilledButton(
                            titleColor: Colors.white,
                            title:
                                (state is SignUpInitial) ? "Next" : 'Sign up',
                            onPressed: () {
                              _onSubmit(context, state);
                            },
                            backgroundColor: themeData.primaryColor);
                      },
                    )),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Already have an account?',
                  style: themeData.textTheme.bodySmall,
                ),
                TextButton(
                    onPressed: () {
                      context.replace('/auth/sign_in');
                    },
                    child: Text(
                      'Sign in here',
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

  Column _firstnameLastnameInput() {
    return Column(
      children: [
        AuthInputField(
          validator: validateName,
          controller: _firstNameController,
          hintText: 'Enter firstname',
        ),
        SizedBox(height: 15),
        AuthInputField(
          validator: validateName,
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
          validator: validateEmail,
          controller: _emailController,
          hintText: 'Enter your email address',
        ),
        SizedBox(height: 15),
        AuthInputField(
          validator: validatePassword,
          controller: _passwordController,
          isPassword: true,
          hintText: 'Enter password',
        ),
        SizedBox(height: 15),
        AuthInputField(
          validator: (value) =>
              validateConfirmPassword(value, _passwordController.text),
          controller: _confirmPasswordController,
          isPassword: true,
          hintText: 'Confirm password',
        ),
      ],
    );
  }
}

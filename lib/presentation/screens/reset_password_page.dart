import 'package:chat_app/core/utils/validators.dart';
import 'package:chat_app/presentation/blocs/reset_password/reset_password_cubit.dart';
import 'package:chat_app/presentation/widgets/auth_input_field.dart';
import 'package:chat_app/presentation/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key, this.email});
  final String? email;

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();

  void onSent() {
    final email = _emailController.text;
    if (_formKey.currentState!.validate()) {
      context.read<ResetPasswordCubit>().sendResetCode(email);
    }
  }

  @override
  Widget build(BuildContext context) {
    _emailController.text = widget.email ?? '';
    final themeData = Theme.of(context);
    return Scaffold(
      appBar: CustomAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 28.0),
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
              'Reset password',
              style: themeData.textTheme.bodyLarge
                  ?.copyWith(fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 10),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  AuthInputField(
                    validator: validateEmail,
                    controller: _emailController,
                    hintText: 'Enter your email address',
                  ),
                ],
              ),
            ),
            BlocBuilder<ResetPasswordCubit, ResetPasswordState>(
              builder: (context, state) {
                return Column(
                  children: [
                    SizedBox(height: 10),
                    (state is ResetPasswordMessageSent) ||
                            (state is ResetPasswordWaitingTimer)
                        ? Text(
                            "We've sent a code to your email. Please check your inbox and reset your password. Then, try logging in with your new password.",
                            style: themeData.textTheme.bodySmall
                                ?.copyWith(color: themeData.canvasColor),
                          )
                        : SizedBox(),
                    (state is ResetPasswordTryAgain)
                        ? Text(
                            "Send code again?",
                            style: themeData.textTheme.bodySmall
                                ?.copyWith(color: themeData.canvasColor),
                          )
                        : SizedBox(),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: FilledButton(
                          style: ButtonStyle(
                              shadowColor: WidgetStatePropertyAll(
                                  Colors.black.withAlpha(50)),
                              backgroundColor: WidgetStatePropertyAll(
                                  (state is! ResetPasswordWaitingTimer)
                                      ? themeData.primaryColor
                                      : Color(0xff7FACFF))),
                          onPressed: ((state is ResetPasswordLoading) ||
                                  (state is ResetPasswordWaitingTimer))
                              ? null
                              : onSent,
                          child: (state is ResetPasswordLoading)
                              ? CircularProgressIndicator(
                                  color: Colors.white,
                                )
                              : Text(
                                  'Send message',
                                  style: themeData.textTheme.bodyMedium
                                      ?.copyWith(color: Colors.white),
                                )),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    (state is ResetPasswordWaitingTimer)
                        ? Text(
                            "You can send code again after ${state.seconds} seconds",
                            style: themeData.textTheme.bodySmall
                                ?.copyWith(color: themeData.canvasColor),
                          )
                        : SizedBox(),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

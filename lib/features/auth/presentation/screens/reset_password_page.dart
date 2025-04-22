import 'package:chat_app/core/shared/widgets/app_logo_type.dart';
import 'package:chat_app/core/utils/validators.dart';
import 'package:chat_app/features/auth/presentation/blocs/reset_password/reset_password_cubit.dart';
import 'package:chat_app/features/auth/presentation/widgets/auth_input_field.dart';
import 'package:chat_app/core/shared/widgets/custom_app_bar.dart';
import 'package:chat_app/injection/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key, this.email});
  final String? email;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ResetPasswordCubit(),
      child: ResetPasswordContent(email: email),
    );
  }
}

class ResetPasswordContent extends StatefulWidget {
  const ResetPasswordContent({super.key, this.email});
  final String? email;

  @override
  State<ResetPasswordContent> createState() => _ResetPasswordContentState();
}

class _ResetPasswordContentState extends State<ResetPasswordContent> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  late final ResetPasswordCubit _resetCubit;

  Future<void> onSent() async {
    final email = _emailController.text;
    if (_formKey.currentState!.validate()) {
      await _resetCubit.sendResetCode(email);
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _resetCubit = sl<ResetPasswordCubit>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _emailController.text = widget.email ?? '';
    final themeData = Theme.of(context);
    return Scaffold(
      appBar: CustomAppBar(pageContext: context,),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 28.0),
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            Center(child: AppLogoType()),
            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
            Text('Reset password',
                style: themeData.textTheme.bodyLarge
                    ?.copyWith(fontWeight: FontWeight.w600)),
            SizedBox(height: 10),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  BlocBuilder<ResetPasswordCubit, ResetPasswordState>(
                    bloc: _resetCubit,
                    builder: (context, state) {
                      return AuthInputField(
                        enabled: !(state is! ResetPasswordInitial &&
                            state is! ResetPasswordTryAgain),
                        validator: validateEmail,
                        controller: _emailController,
                        hintText: 'Enter your email address',
                      );
                    },
                  ),
                ],
              ),
            ),
            BlocBuilder<ResetPasswordCubit, ResetPasswordState>(
              bloc: _resetCubit,
              builder: (context, state) {
                print(state);
                return Column(
                  children: [
                    SizedBox(height: 5),
                    _infoTextWidget(state, themeData),
                    SizedBox(height: 20),
                    SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: _sendCodeButton(state, themeData)),
                    SizedBox(height: 20),
                    _textWithTimer(state, themeData)
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _infoTextWidget(ResetPasswordState state, ThemeData themeData) {
    if ((state is ResetPasswordMessageSent) ||
        (state is ResetPasswordWaitingTimer)) {
      return Text(
          "We've sent a code to your email. Please check your inbox and reset your password. Then, try logging in with your new password.",
          style: themeData.textTheme.bodySmall?.copyWith(
            color: themeData.canvasColor,
            fontSize: 12,
          ));
    } else if (state is ResetPasswordTryAgain) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text("Send code again?",
                style: themeData.textTheme.bodySmall?.copyWith(
                    fontSize: 12, color: themeData.canvasColor, height: 1)),
          ),
        ],
      );
    } else {
      return SizedBox();
    }
  }

  Widget _textWithTimer(ResetPasswordState state, ThemeData themeData) {
    return (state is ResetPasswordWaitingTimer)
        ? Text("You can send code again after ${state.seconds} seconds",
            style: themeData.textTheme.bodySmall
                ?.copyWith(color: themeData.canvasColor))
        : SizedBox();
  }

  FilledButton _sendCodeButton(ResetPasswordState state, ThemeData themeData) {
    return FilledButton(
        style: ButtonStyle(
            shadowColor: WidgetStatePropertyAll(Colors.black.withAlpha(50)),
            backgroundColor: WidgetStatePropertyAll(
                ((state is ResetPasswordLoading) ||
                        (state is ResetPasswordWaitingTimer) ||
                        (state is ResetPasswordMessageSent))
                    ? Color(0xff7FACFF)
                    : themeData.primaryColor)),
        onPressed: ((state is ResetPasswordLoading) ||
                (state is ResetPasswordWaitingTimer) ||
                (state is ResetPasswordMessageSent))
            ? null
            : onSent,
        child: (state is ResetPasswordLoading)
            ? CircularProgressIndicator(color: Colors.white)
            : Text('Send code',
                style: themeData.textTheme.bodyMedium
                    ?.copyWith(color: Colors.white)));
  }
}

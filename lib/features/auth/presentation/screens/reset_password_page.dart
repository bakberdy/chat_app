import 'package:chat_app/core/shared/widgets/app_logo_type.dart';
import 'package:chat_app/core/utils/error_toast.dart';
import 'package:chat_app/core/utils/validators.dart';
import 'package:chat_app/features/auth/presentation/bloc/auth_bloc.dart';
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
    return BlocProvider.value(
      value: sl<AuthBloc>(),
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

  void onSent({required AuthBloc bloc}) async {
    final email = _emailController.text;
    if (_formKey.currentState!.validate()) {
      bloc.add(AuthEvent.sendResetMessageToEmail(email: email));
    }
  }

  void _authBlocListener(BuildContext context, AuthState state) {
    if (state.resetPassword == ResetPasswordStatus.error) {
      showErrorToast(state.errorMessage ?? 'Неизвестная ошибка', context);
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _emailController.text = widget.email ?? '';
    final authBloc = context.read<AuthBloc>();
    final themeData = Theme.of(context);
    return BlocListener<AuthBloc, AuthState>(
      bloc: authBloc,
      listener: _authBlocListener,
      child: Scaffold(
        appBar: CustomAppBar(
          pageContext: context,
        ),
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
                autovalidateMode: AutovalidateMode.onUserInteraction,
                key: _formKey,
                child: Column(
                  children: [
                    BlocBuilder<AuthBloc, AuthState>(
                      bloc: authBloc,
                      builder: (context, state) {
                        return AuthInputField(
                          enabled: !(state.resetPassword !=
                                  ResetPasswordStatus.initial &&
                              state.resetPassword !=
                                  ResetPasswordStatus.tryAgain),
                          validator: validateEmail,
                          controller: _emailController,
                          hintText: 'Enter your email address',
                        );
                      },
                    ),
                  ],
                ),
              ),
              BlocBuilder<AuthBloc, AuthState>(
                bloc: authBloc,
                builder: (context, state) {
                  return Column(
                    children: [
                      SizedBox(height: 5),
                      _infoTextWidget(state, themeData),
                      SizedBox(height: 20),
                      SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: _sendCodeButton(themeData,
                              bloc: authBloc, state: state)),
                      SizedBox(height: 20),
                      _textWithTimer(state, themeData)
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _infoTextWidget(AuthState state, ThemeData themeData) {
    if ((state.resetPassword == ResetPasswordStatus.waitingTimer)) {
      return Text(
          "We've sent a code to your email. Please check your inbox and reset your password. Then, try logging in with your new password.",
          style: themeData.textTheme.bodySmall?.copyWith(
            color: themeData.canvasColor,
            fontSize: 12,
          ));
    } else if (state.resetPassword == ResetPasswordStatus.tryAgain) {
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

  Widget _textWithTimer(AuthState state, ThemeData themeData) {
    return (state.resetPassword == ResetPasswordStatus.waitingTimer)
        ? Text("You can send code again after ${state.timerDuration} seconds",
            style: themeData.textTheme.bodySmall
                ?.copyWith(color: themeData.canvasColor))
        : SizedBox();
  }

  FilledButton _sendCodeButton(
    ThemeData themeData, {
    required AuthBloc bloc,
    required AuthState state,
  }) {
    return FilledButton(
        style: ButtonStyle(
            shadowColor: WidgetStatePropertyAll(Colors.black.withAlpha(50)),
            backgroundColor: WidgetStatePropertyAll(((state.resetPassword ==
                        ResetPasswordStatus.loading) ||
                    (state.resetPassword == ResetPasswordStatus.waitingTimer))
                ? Color(0xff7FACFF)
                : themeData.primaryColor)),
        onPressed: ((state.resetPassword == ResetPasswordStatus.loading) ||
                (state.resetPassword == ResetPasswordStatus.waitingTimer))
            ? null
            : () => onSent(bloc: bloc),
        child: (state.resetPassword == ResetPasswordStatus.loading)
            ? CircularProgressIndicator(color: Colors.white)
            : Text('Send code',
                style: themeData.textTheme.bodyMedium
                    ?.copyWith(color: Colors.white)));
  }
}

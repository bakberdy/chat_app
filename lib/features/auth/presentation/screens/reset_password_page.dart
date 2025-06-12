import 'package:chat_app/core/core.dart';
import '../auth_bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/widgets.dart';

class ResetPasswordPage extends StatelessWidget {
  const ResetPasswordPage({super.key, this.email});
  final String? email;

  @override
  Widget build(BuildContext context) {
    return ResetPasswordPageContent(email: email);
  }
}

class ResetPasswordPageContent extends StatefulWidget {
  const ResetPasswordPageContent({super.key, this.email});
  final String? email;

  @override
  State<ResetPasswordPageContent> createState() =>
      _ResetPasswordPageContentState();
}

class _ResetPasswordPageContentState extends State<ResetPasswordPageContent> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _emailController;
  late final AuthBloc _authBloc;

  @override
  void initState() {
    _emailController = TextEditingController(text: widget.email);
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
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themeData = context.theme;
    return Scaffold(
      appBar: CustomAppBar(pageContext: context),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 28.0),
        child: BlocConsumer<AuthBloc, AuthState>(
          bloc: _authBloc,
          listener: _authBlocListener,
          builder: (context, state) {
            final isInputEnabled = state.resetPasswordState.isInitial ||
                state.resetPasswordState.isTryAgain;
            return Column(
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                Center(child: AppLogoType()),
                SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                Text(
                  'Reset password',
                  style: themeData.textTheme.bodyLarge
                      ?.copyWith(fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 10),
                Form(
                  key: _formKey,
                  child: AuthInputField(
                    enabled: isInputEnabled,
                    validator: validateEmail,
                    controller: _emailController,
                    hintText: 'Enter your email address',
                  ),
                ),
                SizedBox(height: 5),
                ResetPasswordInfoText(
                  resetPasswordStatus: state.resetPasswordState,
                ),
                SizedBox(height: 20),
                SendCodeButton(
                  resetPasswordState: state.resetPasswordState,
                  onPressed: () => _onSendCode(bloc: _authBloc),
                  isLoading: state.status.isLoading,
                ),
                SizedBox(height: 20),
                ResetPasswordTimerText(
                  resetPasswordStatus: state.resetPasswordState,
                  themeData: themeData,
                  remainingTimeInSeconds: state.timerDuration,
                )
              ],
            );
          },
        ),
      ),
    );
  }

  void _onSendCode({required AuthBloc bloc}) async {
    final email = _emailController.text;
    if (_formKey.currentState!.validate()) {
      bloc.add(AuthEvent.resetPassword(email: email));
    }
  }

  void _authBlocListener(BuildContext context, AuthState state) {
    // if (state.status.isError) {
    //   showErrorToast(context, message: state.message ?? 'Неизвестная ошибка');
    // } else if (state.status.isLoaded && state.message != null) {
    //   showInfoToast(context, message: state.message!);
    // }
  }
}

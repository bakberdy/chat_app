import 'package:chat_app/injection/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/core.dart';
import '../auth_bloc/auth_bloc.dart';
import '../widgets/widgets.dart';

class SignInSocial extends StatelessWidget {
  const SignInSocial({super.key});

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    final authBloc = sl<AuthBloc>();
    return BlocProvider(
      create: (context) => authBloc,
      child: BlocListener<AuthBloc, AuthState>(
        bloc: authBloc,
        listener: _authBlocListener,
        child: Scaffold(
            backgroundColor: Color(0xffF7F7F9),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28),
              child: ListView(
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height * 0.12),
                  Center(
                    child: RichText(
                        text: TextSpan(
                            style: themeData.textTheme.bodyMedium?.copyWith(
                                fontSize: 60, fontWeight: FontWeight.w700),
                            children: [
                          TextSpan(text: 'Talky'),
                          TextSpan(
                              text: '.',
                              style: TextStyle(color: themeData.primaryColor))
                        ])),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.10),
                  CustomFilledButton(
                    svgIconPath: 'lib/assets/icons/iconGoogle.svg',
                    title: 'Sign in with Google',
                    onPressed: () => _onSignInWithGoogle(bloc: authBloc),
                    backgroundColor: Colors.white,
                  ),
                  SizedBox(height: 15),
                  CustomFilledButton(
                    svgIconPath: 'lib/assets/icons/Facebook.svg',
                    title: 'Sign in with Facebook',
                    onPressed: () => _onSignInWithMeta(bloc: authBloc),
                    backgroundColor: Colors.white,
                  ),
                  SizedBox(height: 15),
                  CustomFilledButton(
                    svgIconPath: 'lib/assets/icons/Apple.svg',
                    title: 'Sign in with Apple',
                    onPressed: () => _onSignInWithApple(bloc: authBloc),
                    backgroundColor: Colors.white,
                  ),
                  SizedBox(height: 30),
                  DividerWithText(text: 'or'),
                  SizedBox(height: 30),
                  CustomFilledButton(
                      title: 'Continue with email',
                      onPressed: () => _onContinueWithEmail(context),
                      backgroundColor: Colors.white),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.08,
                  ),
                ],
              ),
            )),
      ),
    );
  }

  void _onSignInWithGoogle({required AuthBloc bloc}) {
    bloc.add(AuthEvent.googleSignIn());
  }

  void _onSignInWithApple({required AuthBloc bloc}) {
    bloc.add(AuthEvent.appleSignIn());
  }

  void _onSignInWithMeta({required AuthBloc bloc}) {
    debugPrint('not setted');
  }

  void _onContinueWithEmail(BuildContext context) {
    context.push('${AppPaths.auth}${AppPaths.signIn}');
  }

  void _authBlocListener(BuildContext context, AuthState state) {
    if (state.signInStatus == StateStatus.error) {
      showErrorToast(state.errorMessage ?? 'Неизвестная ошибка', context);
    }
  }
}

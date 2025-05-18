import 'package:chat_app/core/bloc/state_status.dart';
import 'package:chat_app/core/navigation/routing/app_paths.dart';
import 'package:chat_app/core/utils/error_toast.dart';
import 'package:chat_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:chat_app/core/shared/widgets/custom_filled_button.dart';
import 'package:chat_app/injection/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SignInSocial extends StatelessWidget {
  const SignInSocial({super.key});

  void _onSignInWithGoogle({required AuthBloc bloc}) {
    bloc.add(AuthEvent.googleSignIn());
  }

  void _onSignInWithApple({required AuthBloc bloc}) {
    bloc.add(AuthEvent.appleSignIn());
  }

  void _onSignInWithMeta({required AuthBloc bloc}) {
    print('not setted');
  }

  void _onContinueWithEmail(BuildContext context) {
    context.push('${AppPaths.auth}${AppPaths.signIn}');
  }

  void _authBlocListener(BuildContext context, AuthState state) {
    if (state.signInStatus == StateStatus.error) {
      showErrorToast(state.errorMessage ?? 'Неизвестная ошибка', context);
    }
  }

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
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 28),
                child: Column(
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
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.28,
                            child: Divider(
                              thickness: 1,
                              color: themeData.canvasColor,
                            )),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25.0),
                          child: Text(
                            'or',
                            style: themeData.textTheme.bodyMedium?.copyWith(
                                color: themeData.canvasColor, height: 1),
                          ),
                        ),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.28,
                            child: Divider(
                              thickness: 1,
                              color: themeData.canvasColor,
                            )),
                      ],
                    ),
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
              ),
            )),
      ),
    );
  }
}

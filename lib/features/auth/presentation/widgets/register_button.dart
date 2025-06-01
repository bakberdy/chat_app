import 'package:chat_app/core/core.dart';
import 'package:chat_app/features/auth/presentation/auth_bloc/auth_bloc.dart';
import 'package:flutter/material.dart';

class RegisterButton extends StatelessWidget {
  const RegisterButton(
      {super.key,
      required this.signUpStatus,
      required this.onRegisterPressed,
      required this.onNextPressed,
      required this.bgColor});

  final SignUpStatus signUpStatus;
  final VoidCallback onRegisterPressed;
  final VoidCallback onNextPressed;
  final Color bgColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 55,
        child: CustomFilledButton(
            isLoading: signUpStatus == SignUpStatus.loading,
            titleColor: Colors.white,
            title: (signUpStatus == SignUpStatus.initial) ? "Next" : 'Register',
            onPressed: () {
              if (signUpStatus == SignUpStatus.initial) {
                onNextPressed();
              } else {
                onRegisterPressed();
              }
            },
            backgroundColor: bgColor));
  }
}

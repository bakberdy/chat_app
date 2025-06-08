import 'package:chat_app/core/core.dart';
import 'package:chat_app/features/auth/presentation/auth_bloc/auth_bloc.dart';
import 'package:flutter/material.dart';

class RegisterButton extends StatelessWidget {
  const RegisterButton(
      {super.key,
      required this.registrationState,
      required this.onRegisterPressed,
      required this.onNextPressed,
      required this.bgColor,
      required this.isLoaging});

  final RegistrationState registrationState;
  final VoidCallback onRegisterPressed;
  final VoidCallback onNextPressed;
  final bool isLoaging;
  final Color bgColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 55,
        child: CustomFilledButton(
            isLoading: isLoaging,
            titleColor: Colors.white,
            title: (registrationState == RegistrationState.nameInput)
                ? "Next"
                : 'Register',
            onPressed: () {
              if (registrationState == RegistrationState.nameInput) {
                onNextPressed();
              } else {
                onRegisterPressed();
              }
            },
            backgroundColor: bgColor));
  }
}

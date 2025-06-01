import 'package:chat_app/core/utils/validators.dart';
import 'package:chat_app/features/auth/presentation/widgets/auth_input_field.dart';
import 'package:flutter/material.dart';

class EmailAndPasswordInputForm extends StatelessWidget {
  const EmailAndPasswordInputForm(
      {super.key,
      this.emailController,
      this.passwordController,
      this.confirmPasswordController,
      this.formKey});
  final TextEditingController? emailController;
  final TextEditingController? passwordController;
  final TextEditingController? confirmPasswordController;
  final GlobalKey<FormState>? formKey;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          AuthInputField(
            keyBoardType: TextInputType.emailAddress,
            key: ValueKey('email'),
            validator: validateEmail,
            controller: emailController,
            hintText: 'Enter your email address',
          ),
          SizedBox(height: 15),
          AuthInputField(
            keyBoardType: TextInputType.visiblePassword,
            key: ValueKey('password'),
            validator: validatePassword,
            controller: passwordController,
            isPassword: true,
            hintText: 'Enter password',
          ),
          SizedBox(height: 15),
          AuthInputField(
            keyBoardType: TextInputType.visiblePassword,
            key: ValueKey('confirmPassword'),
            validator: (value) =>
                validateConfirmPassword(value, passwordController?.text),
            controller: confirmPasswordController,
            isPassword: true,
            hintText: 'Confirm password',
          ),
        ],
      ),
    );
  }
}

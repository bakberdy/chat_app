import 'package:chat_app/core/core.dart';
import 'package:chat_app/features/auth/presentation/auth_bloc/auth_bloc.dart';
import 'package:chat_app/features/auth/presentation/widgets/auth_input_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ChangePasswordBottomSheetContent extends StatefulWidget {
  const ChangePasswordBottomSheetContent({
    super.key,
  });

  @override
  State<ChangePasswordBottomSheetContent> createState() =>
      _ChangePasswordBottomSheetContentState();
}

class _ChangePasswordBottomSheetContentState
    extends State<ChangePasswordBottomSheetContent> {
  final _oldPasswordController = TextEditingController();
  final _newPasswordController = TextEditingController();
  final _newPasswordConfirmController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      color: Colors.white,
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 20),
            Text('Change password',
                style: context.theme.textTheme.bodyMedium
                    ?.copyWith(fontWeight: FontWeight.w600)),
            SizedBox(height: 20),
            AuthInputField(
              validator: validatePassword,
              isPassword: true,
              hintText: 'old password',
              controller: _oldPasswordController,
            ),
            Divider(height: 30),
            AuthInputField(
              validator: validatePassword,
              isPassword: true,
              hintText: 'new password',
              controller: _newPasswordController,
            ),
            SizedBox(height: 15),
            AuthInputField(
              validator: (value) =>
                  validateConfirmPassword(value, _newPasswordController.text),
              isPassword: true,
              hintText: 'confirm new password',
              controller: _newPasswordConfirmController,
            ),
            SizedBox(height: 20),
            SizedBox(
              height: 40,
              child: CustomFilledButton(
                titleColor: Colors.white,
                title: 'Change',
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    final oldPassword = _oldPasswordController.text;
                    final newPassword = _newPasswordConfirmController.text;
                    context.read<AuthBloc>().add(AuthEvent.changePassword(
                        newPassword: newPassword, oldPassword: oldPassword));
                    context.pop();
                  } else {
                    showErrorToast(context, message: 'Passwords are not valid');
                  }
                },
                backgroundColor: context.theme.primaryColor,
                withShadow: false,
              ),
            ),
            SizedBox(height: 20)
          ],
        ),
      ),
    );
  }
}

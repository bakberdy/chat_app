import 'package:flutter/material.dart';

class AuthInputField extends StatefulWidget {
  const AuthInputField(
      {super.key,
      required this.hintText,
      this.controller,
      this.isPassword = false,
      this.validator,
      this.enabled = true});

  final String hintText;
  final bool enabled;
  final TextEditingController? controller;
  final bool isPassword;
  final String? Function(String?)? validator;

  @override
  State<AuthInputField> createState() => _AuthInputFieldState();
}

class _AuthInputFieldState extends State<AuthInputField> {
  bool obscuredText = true;

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    final outlineInputBorder = OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(width: 1, color: themeData.hintColor));
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      enabled: widget.enabled,
      validator: widget.validator,
      obscureText: (obscuredText && widget.isPassword),
      controller: widget.controller,
      style: themeData.textTheme.bodySmall
          ?.copyWith(fontWeight: FontWeight.w500, height: 1),
      decoration: InputDecoration(
          contentPadding: EdgeInsets.all(15),
          hintText: widget.hintText,
          hintStyle: themeData.textTheme.bodySmall?.copyWith(
              fontWeight: FontWeight.w400,
              color: themeData.hintColor,
              height: 1),
          border: outlineInputBorder,
          focusedBorder: outlineInputBorder,
          enabledBorder: outlineInputBorder,
          suffixIcon: widget.isPassword
              ? IconButton(
                  onPressed: () {
                    obscuredText = !obscuredText;
                    setState(() {});
                  },
                  icon: Icon(
                    obscuredText ? Icons.visibility : Icons.visibility_off,
                    color: themeData.hintColor,
                  ))
              : null),
    );
  }
}

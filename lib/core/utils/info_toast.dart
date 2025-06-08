import 'package:chat_app/core/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

void showInfoToast(
  BuildContext context, {
  required String message,
}) {
  toastification.show(
    alignment: Alignment.bottomCenter,
    type: ToastificationType.info,
    context: context,
    title: Text(message, maxLines: 4),
    icon: const Icon(Icons.error),
    style: ToastificationStyle.flat,
    backgroundColor: Colors.white,
    showProgressBar: false,
    foregroundColor: context.theme.primaryColor,
    borderSide: BorderSide(width: 1, color: context.theme.primaryColor),
    autoCloseDuration: const Duration(seconds: 2),
    animationBuilder: (context, animation, alignment, child) {
      return FadeTransition(
        opacity: animation,
        child: child,
      );
    },
  );
}

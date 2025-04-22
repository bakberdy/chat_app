import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

void showErrorToast(String message, context) {
  toastification.show(
    type: ToastificationType.error,
    context: context,
    title: Text(message),
    icon: const Icon(Icons.error),
    style: ToastificationStyle.fillColored,
    backgroundColor: Colors.red,
    foregroundColor: Colors.white,
    autoCloseDuration: const Duration(seconds: 2),
    animationBuilder: (context, animation, alignment, child) {
    return FadeTransition(
      opacity: animation,
      child: child,
    );
  },
  );
}

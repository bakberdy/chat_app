import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

void showErrorToast(String message, context) {
  toastification.show(
    alignment: Alignment.bottomCenter,
    type: ToastificationType.error,
    context: context,
    title: Text(message),
    icon: const Icon(Icons.error),
    style: ToastificationStyle.flat,
    backgroundColor: Colors.white,
    showProgressBar: false,
    foregroundColor: Colors.red,
    borderSide: BorderSide(width: 1, color: Colors.red),
    autoCloseDuration: const Duration(seconds: 2),
    animationBuilder: (context, animation, alignment, child) {
    return FadeTransition(
      opacity: animation,
      child: child,
    );
  },
  );
}

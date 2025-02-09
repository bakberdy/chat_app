import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'reset_password_state.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  ResetPasswordCubit() : super(ResetPasswordInitial());

  Future<void> sendResetCode(String email) async {
    try {
      emit(ResetPasswordLoading());

      // Симуляция запроса на отправку кода
      await Future.delayed(Duration(seconds: 2));

      // Допустим, сервер отправил код и всё прошло успешно
      emit(ResetPasswordMessageSent());

      // Таймер на повторную отправку (например, 30 секунд)
      _startResendTimer(30);
    } catch (e) {
      emit(ResetPasswordError(message: "Ошибка отправки кода"));
    }
  }

  void _startResendTimer(int seconds) {
    int remainingSeconds = seconds;
    Timer.periodic(Duration(seconds: 1), (timer) {
      if (remainingSeconds > 0) {
        emit(ResetPasswordWaitingTimer(seconds: remainingSeconds));
        remainingSeconds--;
      } else {
        timer.cancel();
        emit(ResetPasswordTryAgain()); // После таймера можно вернуть начальное состояние
      }
    });
  }

  Future<void> resetPassword(String email, String code, String newPassword) async {
    try {
      emit(ResetPasswordLoading());

      // Симуляция запроса на сброс пароля
      await Future.delayed(Duration(seconds: 2));

      // Допустим, пароль успешно сброшен
      emit(ResetPasswordInitial());
    } catch (e) {
      emit(ResetPasswordError(message: "Ошибка сброса пароля"));
    }
  }
}

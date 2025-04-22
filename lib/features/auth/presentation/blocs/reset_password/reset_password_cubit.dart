import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'reset_password_state.dart';

@injectable
class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  ResetPasswordCubit() : super(ResetPasswordInitial());

  bool _isClosed = false;

  @override
  Future<void> close() {
    print('Reset Password closed');
    _isClosed = true;
    return super.close();
  }

  Future<void> sendResetCode(String email) async {
    
    try {
      emit(ResetPasswordLoading());
      print("Send Reset Code Cubit");

      // Симуляция запроса на отправку кода
      await Future.delayed(Duration(seconds: 2));

      // Допустим, сервер отправил код и всё прошло успешно
      if(_isClosed)return;
      emit(ResetPasswordMessageSent());

      // Таймер на повторную отправку (например, 30 секунд)
      _startResendTimer(30);
    } catch (e) {
      print(e.toString());
      if (_isClosed) return;
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

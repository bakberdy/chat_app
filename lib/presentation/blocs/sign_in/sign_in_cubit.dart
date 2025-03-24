
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit() : super(SignInInitial());

  Future<void> signInWithGoogle() async {
    emit(SignInLoading());
    await Future.delayed(Duration(seconds: 2));
    emit(SignInSuccess());
  }
  
  Future<void> signInWitEmail(String email, String password) async {
    emit(SignInLoading());
    await Future.delayed(Duration(seconds: 2));
    emit(SignInSuccess());
  }
}

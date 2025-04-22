
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';


part 'sign_in_state.dart';

@injectable
class SignInCubit extends Cubit<SignInState> {
  SignInCubit() : super(SignInInitial());

  Future<void> signInWithGoogle() async {
    print('Sign In With Google event');
    emit(SignInLoading());
    await Future.delayed(Duration(seconds: 2));
    emit(SignInSuccess());
  }
  
  Future<void> signInWitEmail(String email, String password) async {
    print('Sign In With Email with \n{\n  "email":$email, \n  "password":$password\n}');
    emit(SignInLoading());
    await Future.delayed(Duration(seconds: 2));
    emit(SignInSuccess());
  }
}

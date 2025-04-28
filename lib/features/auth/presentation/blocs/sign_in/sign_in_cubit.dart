
import 'package:chat_app/core/auth/auth_listener.dart';
import 'package:chat_app/core/auth/auth_service.dart';
import 'package:chat_app/features/auth/domain/enitities/sign_in_with_email_entity.dart';
import 'package:chat_app/injection/injection.dart';
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
  
  Future<void> signInWitEmail(SignInWithEmailEntity signInParams) async {
    print('Sign In With Email with \n ${signInParams.toString()}');
    emit(SignInLoading());
    await Future.delayed(Duration(seconds: 2));
    //sl<AuthService>().updateAuthState(signInParams.email);
    emit(SignInSuccess());
  }
}

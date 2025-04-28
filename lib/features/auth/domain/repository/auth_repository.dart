import 'package:chat_app/core/utils/typedef.dart';
import 'package:chat_app/features/auth/domain/enitities/sign_in_with_email_entity.dart';
import 'package:chat_app/features/auth/domain/enitities/sign_up_with_email_entity.dart';

abstract class AuthRepository {
  ResultVoid signUpWithEmail(SignUpWithEmailEntity signUpParams);
  ResultVoid signInWithEmail(SignInWithEmailEntity signInParams);
  ResultVoid resetPassword(String email);
  ResultVoid signInWithGoogle();
  ResultVoid signInWithApple();
}

import 'package:chat_app/core/utils/typedef.dart';


abstract class AuthRepository {
  ResultVoid signUpWithEmail({required String email, required String password, required String firstName, required String lastName});
  ResultVoid signInWithEmail({required String email, required String password});
  ResultVoid resetPassword(String email);
  ResultVoid signInWithGoogle();
  ResultVoid signInWithApple();
}

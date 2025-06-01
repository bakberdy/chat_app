//external dependencies
import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:talker_flutter/talker_flutter.dart';

//app core dependencies
import 'package:chat_app/core/core.dart';

//implementation
part 'auth_remote_data_source_impl.dart';

abstract class AuthRemoteDataSource {
  Future<void> signUpWithEmail(
      {required String email,
      required String password,
      required String firstName,
      required String lastName});
  Future<void> signInWithEmail(
      {required String email, required String password});
  Future<void> resetPassword(String email);
  Future<void> signInWithGoogle();
  Future<void> signInWithApple();
}

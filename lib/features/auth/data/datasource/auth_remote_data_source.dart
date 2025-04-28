import 'package:chat_app/features/auth/data/models/sign_in_with_email_model.dart';
import 'package:chat_app/features/auth/data/models/sign_up_with_email_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class AuthRemoteDataSource {
  Future<void> signUpWithEmail(SignUpWithEmailModel signUpParams);
  Future<void> signInWithEmail(SignInWithEmailModel signInParams);
  Future<void> resetPassword(String email);
  Future<void> signInWithGoogle();
  Future<void> signInWithApple();
}

class AuthSupabaseDataSourceImpl implements AuthRemoteDataSource {
  final SupabaseClient _supabaseClient;
  const AuthSupabaseDataSourceImpl(this._supabaseClient);

  @override
  Future<void> resetPassword(String email) async {
    await _supabaseClient.auth.resetPasswordForEmail(email);
  }

  @override
  Future<void> signInWithApple() {
    throw UnimplementedError();
  }

  @override
  Future<void> signInWithEmail(SignInWithEmailModel signInParams) {
    throw UnimplementedError();
  }

  @override
  Future<void> signInWithGoogle() {
    throw UnimplementedError();
  }

  @override
  Future<void> signUpWithEmail(SignUpWithEmailModel signUpParams) {
    throw UnimplementedError();
  }
}

import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class AuthRemoteDataSource {
  Future<void> signUpWithEmail({required String email, required String password, required String firstName, required String lastName});
  Future<void> signInWithEmail({required String email, required String password});
  Future<void> resetPassword(String email);
  Future<void> signInWithGoogle();
  Future<void> signInWithApple();
}

@Singleton(as: AuthRemoteDataSource)
class AuthSupabaseDataSourceImpl implements AuthRemoteDataSource {
  final SupabaseClient _supabaseClient;
  final GoogleSignIn _googleSignIn;
  const AuthSupabaseDataSourceImpl(this._supabaseClient, this._googleSignIn);


  @override
  Future<void> resetPassword(String email) async {
    await _supabaseClient.auth.resetPasswordForEmail(email);
  }

  @override
  Future<void> signInWithEmail({required String email, required String password}) async {
    final authResponse = await _supabaseClient.auth.signInWithPassword(
        password: password, email: email);
    if (authResponse.session != null && authResponse.user != null) {
      return;
    } else {
      throw AuthException('sign in with email failed');
    }
  }

  @override
  Future<void> signUpWithEmail({required String email, required String password, required String firstName, required String lastName}) async {
    final authResponse = await _supabaseClient.auth.signUp(
        password: password,
        email: email,
        data: {
          "first_name": firstName,
          "last_name": lastName
        });
    if (authResponse.session != null && authResponse.user != null) {
      return;
    } else {
      throw AuthException('sign in with email failed');
    }
  }

  @override
  Future<void> signInWithGoogle() async {
    /// TODO: update the Web client ID with your own.
    ///
    /// Web Client ID that you registered with Google Cloud.
    // const webClientId = 'my-web.apps.googleusercontent.com';

    /// TODO: update the iOS client ID with your own.
    ///
    /// iOS Client ID that you registered with Google Cloud.
    //  const iosClientId = 'my-ios.apps.googleusercontent.com';

    // Google sign in on Android will work without providing the Android
    // Client ID registered on Google Cloud.

    // final GoogleSignIn googleSignIn = GoogleSignIn(
    //     // clientId: iosClientId,
    //     //  serverClientId: webClientId,
    //     );
    final googleUser = await _googleSignIn.signIn();
    final googleAuth = await googleUser!.authentication;
    final accessToken = googleAuth.accessToken;
    final idToken = googleAuth.idToken;

    if (accessToken == null) {
      throw 'No Access Token found.';
    }
    if (idToken == null) {
      throw 'No ID Token found.';
    }

    _supabaseClient.auth.signInWithIdToken(
      provider: OAuthProvider.google,
      idToken: idToken,
      accessToken: accessToken,
    );
  }

  @override
  Future<void> signInWithApple() async {
    final rawNonce = _supabaseClient.auth.generateRawNonce();
    final hashedNonce = sha256.convert(utf8.encode(rawNonce)).toString();

   
    final credential = await SignInWithApple.getAppleIDCredential(
      scopes: [
        AppleIDAuthorizationScopes.email,
        AppleIDAuthorizationScopes.fullName,
      ],
      nonce: hashedNonce,
    );

    final idToken = credential.identityToken;
    if (idToken == null) {
      throw const AuthException(
          'Could not find ID Token from generated credential.');
    }

    await _supabaseClient.auth.signInWithIdToken(
      provider: OAuthProvider.apple,
      idToken: idToken,
      nonce: rawNonce,
    );
  }
}

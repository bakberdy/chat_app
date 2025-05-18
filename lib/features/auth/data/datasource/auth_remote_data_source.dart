import 'dart:convert';
import 'package:chat_app/core/error/exception.dart';
import 'package:crypto/crypto.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

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

@Singleton(as: AuthRemoteDataSource)
class AuthSupabaseDataSourceImpl implements AuthRemoteDataSource {
  final SupabaseClient _supabaseClient;
  final GoogleSignIn _googleSignIn;
  const AuthSupabaseDataSourceImpl(this._supabaseClient, this._googleSignIn);

  @override
  Future<void> resetPassword(String email) async {
    try {
      await _supabaseClient.auth.resetPasswordForEmail(email);
    } on AuthException catch (e) {
      throw ServerException(e.message);
    } catch (e) {
      throw UnknownException('Unknown error occurred: ${e.toString()}');
    }
  }

  @override
  Future<void> signInWithEmail(
      {required String email, required String password}) async {
    try {
      await _supabaseClient.auth
          .signInWithPassword(password: password, email: email);
    } on AuthException catch (e) {
      throw ServerException(e.message);
    } catch (e) {
      throw UnknownException('Unknown error occurred: ${e.toString()}');
    }
  }

  @override
  Future<void> signUpWithEmail(
      {required String email,
      required String password,
      required String firstName,
      required String lastName}) async {
    try {
      final authResponse = await _supabaseClient.auth.signUp(
          password: password,
          email: email,
          data: {"first_name": firstName, "last_name": lastName});

      if (authResponse.user == null) {
        throw const ServerException('User not found.');
      }
      await _supabaseClient.rest.from('profiles').insert({
        "uid": authResponse.user!.id,
        "first_name": firstName,
        "last_name": lastName,
        "email": email,
      });
    } on AuthException catch (e) {
      throw ServerException(e.message);
    } on PostgrestException catch (e) {
      throw ServerException(e.message);
    } on ServerException {
      rethrow;
    } on Exception catch (e) {
      throw UnknownException('Unknown error occurred: ${e.toString()}');
    } catch (e) {
      throw UnknownException('Unknown error occurred: ${e.toString()}');
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

    final GoogleSignIn googleSignIn = GoogleSignIn(
        // clientId: iosClientId,
        //  serverClientId: webClientId,
        );

    final googleUser = await _googleSignIn.signIn();
    final googleAuth = await googleUser!.authentication;
    final accessToken = googleAuth.accessToken;
    final idToken = googleAuth.idToken;

    if (accessToken == null) {
      throw UnknownException('No Access Token found.');
    }
    if (idToken == null) {
      throw UnknownException('No ID Token found.');
    }
    try {
      await _supabaseClient.auth.signInWithIdToken(
          provider: OAuthProvider.google,
          accessToken: accessToken,
          idToken: idToken);
    } on AuthException catch (e) {
      print(e.toString());
      throw ServerException(e.message);
    } on UnknownException catch (e) {
      print(e.toString());
      rethrow;
    } catch (e) {
      print(e.toString());
      throw UnknownException('Unknown error occurred: ${e.toString()}');
    }
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

    try {
      await _supabaseClient.auth.signInWithIdToken(
        provider: OAuthProvider.apple,
        idToken: idToken,
        nonce: rawNonce,
      );
    } on AuthException catch (e) {
      throw ServerException(e.message);
    } catch (e) {
      throw UnknownException('Unknown error occurred: ${e.toString()}');
    }
  }
}

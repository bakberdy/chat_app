part of 'auth_remote_data_source.dart';

@Singleton(as: AuthRemoteDataSource)
class AuthSupabaseDataSourceImpl implements AuthRemoteDataSource {
  final SupabaseClient _supabaseClient;
  final GoogleSignIn _googleSignIn;
  final Talker talkerLogger;
  const AuthSupabaseDataSourceImpl(
      this._supabaseClient, this._googleSignIn, this.talkerLogger);

  @override
  Future<void> resetPassword(String email) async {
    try {
      await _supabaseClient.auth.resetPasswordForEmail(email);
    } catch (e, s) {
      _handleError(
          error: e,
          stackTrace: s,
          contextMessage: 'AuthSupabaseDataSourceImpl.resetPassword');
    }
  }

  @override
  Future<void> signInWithEmail(
      {required String email, required String password}) async {
    try {
      await _supabaseClient.auth
          .signInWithPassword(password: password, email: email);
    } catch (e, s) {
      _handleError(
          error: e,
          stackTrace: s,
          contextMessage: 'AuthSupabaseDataSourceImpl.signInWithEmail');
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
    } catch (e, s) {
      _handleError(
          error: e,
          stackTrace: s,
          contextMessage: 'AuthSupabaseDataSourceImpl.signUpWithEmail');
    }
  }

  @override
  Future<void> signInWithGoogle() async {
    /// TODOs: update the Web client ID with your own.
    ///
    /// Web Client ID that you registered with Google Cloud.
    // const webClientId = 'my-web.apps.googleusercontent.com';

    /// TODOs: update the iOS client ID with your own.
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
    } catch (e, s) {
      _handleError(
          error: e,
          stackTrace: s,
          contextMessage: 'AuthSupabaseDataSourceImpl.signInWithGoogle');
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
    } catch (e, s) {
      _handleError(
          error: e,
          stackTrace: s,
          contextMessage: 'AuthSupabaseDataSourceImpl.signInWithApple');
    }
  }

  void _handleError({
    required Object error,
    required StackTrace stackTrace,
    required String contextMessage,
  }) {
    if (error is AuthException) {
      talkerLogger.error(error.message, error, stackTrace);
      throw ServerException(error.message);
    } else if (error is PostgrestException) {
      talkerLogger.error(error.message, error, stackTrace);
      throw ServerException(error.message);
    } else if (error is ServerException) {
      talkerLogger.error(error.message, error, stackTrace);
      throw error;
    } else {
      talkerLogger.error(contextMessage, error, stackTrace);
      throw UnknownException('Unknown error occurred: ${error.toString()}');
    }
  }
}

import 'package:chat_app/core/error/exception.dart';
import 'package:chat_app/features/auth/data/datasource/remote/auth_remote_data_source.dart';
import 'package:chat_app/features/auth/domain/usecases/sign_in_with_apple.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mocktail/mocktail.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:talker_flutter/talker_flutter.dart';

class MockSupabaseClient extends Mock implements SupabaseClient {
  final MockGoTrueClient _auth;
  MockSupabaseClient(this._auth);
  @override
  GoTrueClient get auth => _auth;
}

class MockGoTrueClient extends Mock implements GoTrueClient {}

class MockGoogleSignIn extends Mock implements GoogleSignIn {
  @override
  Future<GoogleSignInAccount?> signIn() async {
    return MockGoogleSignInAccount();
  }
}

class MockGoogleSignInAccount extends Mock implements GoogleSignInAccount {
  @override
  Future<GoogleSignInAuthentication> get authentication async =>
      MockGoogleSignInAuth();
}

class MockSignInWithApple extends Mock implements SignInWithAppleUseCase {}

class MockGoogleSignInAuth extends Mock implements GoogleSignInAuthentication {
  @override
  String? get accessToken => 'access_token';

  @override
  String? get idToken => 'id_token';
}

class MockTalker extends Mock implements Talker {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late final SupabaseClient client;
  late final MockGoTrueClient mockAuth;
  late final AuthSupabaseDataSourceImpl dataSourceImpl;
  late final GoogleSignIn googleSignIn;
  late MockSignInWithApple mockSignInWithApple;
  late MockTalker mockTalker;

  //test data
  final String tEmail = 'test@email.com';
  final String tPassword = 'password';
  final String tFirstName = 'firstName';
  final String tLastName = 'lastName';

  final user = User(
      id: 'uuid', appMetadata: {}, userMetadata: {}, aud: '', createdAt: '');
  final authResponse = AuthResponse(
      user: user,
      session: Session(
          accessToken: 'accessToken', tokenType: 'tokenType', user: user));

  setUpAll(() {
    mockAuth = MockGoTrueClient();
    client = MockSupabaseClient(mockAuth);
    googleSignIn = MockGoogleSignIn();
    mockSignInWithApple = MockSignInWithApple();
    mockTalker = MockTalker();
    // Mock the 'auth' property of SupabaseClient to return mockAuth

    dataSourceImpl =
        AuthSupabaseDataSourceImpl(client, googleSignIn, mockTalker);
  });

  setUp(() {
    reset(mockAuth);
    reset(client);
    reset(googleSignIn);
    reset(mockSignInWithApple);
  });

  group('reset password', () {
    test(
        'should complete successfully when [SupabaseClient.auth.resetPassword] is success',
        () async {
      // arrange
      when(() => client.auth.resetPasswordForEmail(any()))
          .thenAnswer((_) async => Future.value());

      // act
      final result = dataSourceImpl.resetPassword('email');

      // assert
      await expectLater(result, completes);
      verify(() => client.auth.resetPasswordForEmail('email')).called(1);
      verifyNoMoreInteractions(client);
    });

    test('should throw an error when [SupabaseClient.auth.resetPassword] fails',
        () async {
      // Arrange
      when(() => client.auth.resetPasswordForEmail(any()))
          .thenThrow(UnknownException('Reset password failed'));

      // Act & Assert
      expect(() => dataSourceImpl.resetPassword('email'),
          throwsA(isA<Exception>()));
    });
  });

  group('sign in with email', () {
    test(
        'should complete successfully when [SupabaseClient.auth.signInWithPassword] is success',
        () async {
      // arrange
      when(() => client.auth.signInWithPassword(
            email: any(named: 'email'),
            password: any(named: 'password'),
          )).thenAnswer((_) async => authResponse);

      // act
      final result =
          dataSourceImpl.signInWithEmail(email: tEmail, password: tPassword);

      // assert
      await expectLater(result, completes);
      verify(() => client.auth
          .signInWithPassword(password: tPassword, email: tEmail)).called(1);
      verifyNoMoreInteractions(client);
    });

    test(
        'should throw an error when [SupabaseClient.auth.signInWithPassword] fails',
        () async {
      // Arrange
      when(() => client.auth.signInWithPassword(
            email: any(named: 'email'),
            password: any(named: 'password'),
          )).thenThrow(UnknownException('Reset password failed'));

      // Act & Assert
      expect(
          () => dataSourceImpl.signInWithEmail(
              email: tEmail, password: tPassword),
          throwsA(isA<Exception>()));
    });
  });

  group('sign up with email', () {
    test(
        'should complete successfully when [SupabaseClient.auth.signUpWithPassword] is success',
        () async {
      // arrange
      when(() => client.auth.signUp(
              email: any(named: 'email'),
              password: any(named: 'password'),
              data: {"first_name": 'firstName', "last_name": 'lastName'}))
          .thenAnswer((_) async => authResponse);

      // act
      final result = dataSourceImpl.signUpWithEmail(
          email: tEmail,
          password: tPassword,
          firstName: tFirstName,
          lastName: tLastName);

      // assert
      await expectLater(result, completes);
      verify(
          () => client.auth.signUp(password: tPassword, email: tEmail, data: {
                "first_name": tFirstName,
                "last_name": tLastName,
              })).called(1);
      verifyNoMoreInteractions(client);
    });

    test(
        'should throw an error when [SupabaseClient.auth.signUpWithPassword] fails',
        () async {
      // Arrange
      when(() => client.auth.signUp(
            data: {
              "first_name": tFirstName,
              "last_name": tLastName,
            },
            email: any(named: 'email'),
            password: any(named: 'password'),
          )).thenThrow(UnknownException('Reset password failed'));

      // Act & Assert
      expect(
          () => dataSourceImpl.signUpWithEmail(
              email: tEmail,
              password: tPassword,
              firstName: tFirstName,
              lastName: tLastName),
          throwsA(isA<Exception>()));
    });
  });

  group('sign in with google', () {
    test(
        'should complete successfully when [SupabaseClient.auth.signInWithGoogle] is success',
        () async {
      // arrange
      when(() => client.auth.signInWithIdToken(
            provider: OAuthProvider.google,
            idToken: any(named: 'idToken'),
            accessToken: any(named: 'accessToken'),
          )).thenAnswer((_) async => authResponse);

      // act
      final result = dataSourceImpl.signInWithGoogle();

      // assert
      await expectLater(result, completes);
      verify(() => client.auth.signInWithIdToken(
            provider: OAuthProvider.google,
            idToken: any(named: 'idToken'),
            accessToken: any(named: 'accessToken'),
          )).called(1);
      verifyNoMoreInteractions(client);
    });

    test(
        'should throw an error when [SupabaseClient.auth.signInWIthGoogle] fails',
        () async {
      // Arrange
      when(() => client.auth.signInWithIdToken(
            provider: OAuthProvider.google,
            idToken: any(named: 'idToken'),
            accessToken: any(named: 'accessToken'),
          )).thenThrow(UnknownException('Reset password failed'));

      // Act & Assert
      expect(
          () => dataSourceImpl.signInWithGoogle(), throwsA(isA<Exception>()));
    });
  });
  group('sign in with apple', () {
    test(
        'should complete successfully when [SupabaseClient.auth.signInWithApple] is success',
        () async {
      // arrange
      when(() => client.auth.signInWithIdToken(
          provider: OAuthProvider.apple,
          idToken: any(named: 'idToken'),
          nonce: any(named: 'nonce'))).thenAnswer((_) async => authResponse);

      // act
      final result = dataSourceImpl.signInWithApple();

      // assert
      await expectLater(result, completes);
      verify(() => client.auth.signInWithIdToken(
            provider: OAuthProvider.apple,
            idToken: any(named: 'idToken'),
            nonce: any(named: 'nonce'),
          )).called(1);
      verifyNoMoreInteractions(client);
    });

    test(
        'should throw an error when [SupabaseClient.auth.signInWIthApple] fails',
        () async {
      // Arrange
      when(() => client.auth.signInWithIdToken(
            provider: OAuthProvider.apple,
            idToken: any(named: 'idToken'),
            accessToken: any(named: 'accessToken'),
          )).thenThrow(UnknownException('failed'));

      // Act & Assert
      expect(() => dataSourceImpl.signInWithApple(), throwsA(isA<Exception>()));
    });
  });
}

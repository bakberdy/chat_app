import 'package:bloc_test/bloc_test.dart';
import 'package:chat_app/core/bloc/state_status.dart';
import 'package:chat_app/core/error/failure.dart';
import 'package:chat_app/core/usecase/usecase.dart';
import 'package:chat_app/features/auth/domain/usecases/reset_password.dart';
import 'package:chat_app/features/auth/domain/usecases/sign_in_with_apple.dart';
import 'package:chat_app/features/auth/domain/usecases/sign_in_with_email.dart';
import 'package:chat_app/features/auth/domain/usecases/sign_in_with_google.dart';
import 'package:chat_app/features/auth/domain/usecases/sign_up_with_email.dart';
import 'package:chat_app/features/auth/presentation/auth_bloc/auth_bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'usecase_mocks.dart';

void main() {
  late AuthBloc authBloc;
  late ResetPassword mockResetPassword;
  late SignInWithEmail mockSignInWithEmail;
  late SignUpWithEmail mockSignUpWithEmail;
  late SignInWithAppleUseCase mockSignInWithApple;
  late SignInWithGoogle mockSignInWithGoogle;

  setUp(() {
    mockResetPassword = MockResetPassword();
    mockSignInWithEmail = MockSignInWithEmail();
    mockSignUpWithEmail = MockSignUpWithEmail();
    mockSignInWithApple = MockSignInWithApple();
    mockSignInWithGoogle = MockSignInWithGoogle();
    authBloc = AuthBloc(
      mockResetPassword,
      mockSignInWithEmail,
      mockSignUpWithEmail,
      mockSignInWithApple,
      mockSignInWithGoogle,
    );
  });

  tearDown(() {
    authBloc.close();
  });

  final tSignInParams = SignInParams(email: 'email', password: 'password');
  final tSignUpParams = SignUpParams(
      email: 'email',
      password: 'password',
      firstName: 'firstName',
      lastName: 'lastName');

  registerFallbackValue(tSignInParams);
  registerFallbackValue(tSignUpParams);
  registerFallbackValue(NoParams());
  group('auth bloc', () {
    group('sign in with email', () {
      blocTest<AuthBloc, AuthState>(
        'emits loading and success when [AuthEvent.signInWithEmail] is added.',
        build: () {
          when(() => mockSignInWithEmail(any()))
              .thenAnswer((_) async => Right(null));
          return authBloc;
        },
        act: (bloc) => bloc.add(
            AuthEvent.signIn(email: 'testEmail', password: 'testPassword')),
        expect: () => const <AuthState>[
          AuthState(loginStatus: StateStatus.loading),
          AuthState(loginStatus: StateStatus.loaded)
        ],
      );

      blocTest<AuthBloc, AuthState>(
        'emits loading and error when [AuthEvent.signInWithEmail] is failed.',
        build: () {
          when(() => mockSignInWithEmail(any())).thenAnswer(
              (_) async => Left(AuthFailure('Authentification failed')));
          return authBloc;
        },
        act: (bloc) => bloc.add(
            AuthEvent.signIn(email: 'testEmail', password: 'testPassword')),
        expect: () => const <AuthState>[
          AuthState(loginStatus: StateStatus.loading),
          AuthState(
              loginStatus: StateStatus.error,
              errorMessage: 'Authentification failed')
        ],
      );
    });
    group('sing up with email', () {
      blocTest(
          'emits loading and success when [AuthEvent.signUpWithEmail] is added',
          build: () {
            when(() => mockSignUpWithEmail(any()))
                .thenAnswer((_) async => Right(null));
            return authBloc;
          },
          act: (AuthBloc authBloc) => authBloc.add(AuthEvent.signUp(
              email: 'testEmail',
              password: 'testPassword',
              firstName: 'firstName',
              lastName: 'lastName')),
          expect: () => [
                AuthState(registrationStatus: RegistrationStatus.loading),
                AuthState(registrationStatus: RegistrationStatus.success),
              ]);

      blocTest(
          'emits loading and error when [AuthEvent.signUpWithEmail] is added and usecase returns a failure',
          build: () {
            when(() => mockSignUpWithEmail(any()))
                .thenAnswer((_) async => Left(AuthFailure('error')));
            return authBloc;
          },
          act: (AuthBloc authBloc) => authBloc.add(AuthEvent.signUp(
              email: 'testEmail',
              password: 'testPassword',
              firstName: 'firstName',
              lastName: 'lastName')),
          expect: () => [
                AuthState(registrationStatus: RegistrationStatus.loading),
                AuthState(
                    registrationStatus: RegistrationStatus.error,
                    errorMessage: 'error'),
                AuthState(
                    registrationStatus: RegistrationStatus.nameGot,
                    errorMessage: 'error'),
              ]);
    });

    group('apple sign in', () {
      blocTest('emits loading and succes when [AuthEvent.appleSignIn] is added',
          build: () {
            when(() => mockSignInWithApple(any()))
                .thenAnswer((_) async => Right(null));
            return authBloc;
          },
          act: (bloc) => bloc.add(AuthEvent.appleSignIn()),
          expect: () => [
                AuthState(loginStatus: StateStatus.loading),
                AuthState(loginStatus: StateStatus.loaded)
              ]);

      blocTest(
          'emits loading and error when [AuthEvent.appleSignIn] is added and usecase returns a failure',
          build: () {
            when(() => mockSignInWithApple(any()))
                .thenAnswer((_) async => Left(AuthFailure('error')));
            return authBloc;
          },
          act: (AuthBloc authBloc) => authBloc.add(AuthEvent.appleSignIn()),
          expect: () => [
                AuthState(loginStatus: StateStatus.loading),
                AuthState(
                    loginStatus: StateStatus.error, errorMessage: 'error'),
              ]);
    });
    group('google sign in', () {
      blocTest(
          'emits loading and succes when [AuthEvent.googleSignIn] is added',
          build: () {
            when(() => mockSignInWithGoogle(any()))
                .thenAnswer((_) async => Right(null));
            return authBloc;
          },
          act: (bloc) => bloc.add(AuthEvent.googleSignIn()),
          expect: () => [
                AuthState(loginStatus: StateStatus.loading),
                AuthState(loginStatus: StateStatus.loaded),
              ]);

      blocTest(
          'emits loading and error when [AuthEvent.googleSingIn] is added and usecase returns a failure',
          build: () {
            when(() => mockSignInWithGoogle(any()))
                .thenAnswer((_) async => Left(AuthFailure('error')));
            return authBloc;
          },
          act: (AuthBloc authBloc) => authBloc.add(AuthEvent.googleSignIn()),
          expect: () => [
                AuthState(loginStatus: StateStatus.loading),
                AuthState(
                    loginStatus: StateStatus.error, errorMessage: 'error'),
              ]);
    });

    group('reset password', () {
      blocTest(
          'emits loading and succes when [AuthEvent.resetPassword] is added',
          build: () {
            when(() => mockResetPassword(any()))
                .thenAnswer((_) async => Right(null));
            return authBloc;
          },
          act: (bloc) =>
              bloc.add(AuthEvent.sendResetMessageToEmail(email: 'email')),
          expect: () => [
                AuthState(resetPassword: ResetPasswordState.loading),
                AuthState(
                  resetPassword: ResetPasswordState.waitingTimer,
                ),
                AuthState(
                    resetPassword: ResetPasswordState.waitingTimer,
                    timerDuration: 60),
              ]);

      blocTest(
          'emits loading and error when [AuthEvent.resetPassword] is added and usecase returns a failure',
          build: () {
            when(() => mockResetPassword(any()))
                .thenAnswer((_) async => Left(AuthFailure('error')));
            return authBloc;
          },
          act: (AuthBloc authBloc) =>
              authBloc.add(AuthEvent.sendResetMessageToEmail(email: 'email')),
          expect: () => [
                AuthState(resetPassword: ResetPasswordState.loading),
                AuthState(
                    resetPassword: ResetPasswordState.error,
                    errorMessage: 'error'),
              ]);
    });
  });
}

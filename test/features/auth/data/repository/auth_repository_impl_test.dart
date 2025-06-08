import 'package:chat_app/core/error/exception.dart';
import 'package:chat_app/core/error/failure.dart';
import 'package:chat_app/features/auth/data/datasource/remote/auth_remote_data_source.dart';
import 'package:chat_app/features/auth/data/repository/auth_repository_impl.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockAuthRemoteDataSource extends Mock implements AuthRemoteDataSource {}

void main() {
  late AuthRemoteDataSource dataSource;
  late AuthRepositoryImpl repoImpl;
  final tEmail = 'test@email.com';
  final tPassword = 'password';
  final tFirstName = 'firstName';
  final tLastName = 'lastName';

  setUp(() {
    dataSource = MockAuthRemoteDataSource();
    repoImpl = AuthRepositoryImpl(dataSource);
  });

  group('AuthRepositoryImpl.signInWithEmail', () {
    test(
        'should call [AuthRepositoryImpl.signInWithEmail] and complete successfully'
        'successfully when AuthRemoteDatasource completes successfully',
        () async {
      //arrange
      when(() => dataSource.signInWithEmail(
              email: any(named: 'email'), password: any(named: 'password')))
          .thenAnswer((_) async => Future.value());

      //act
      final result =
          await repoImpl.signInWithEmail(email: tEmail, password: tPassword);

      //assert
      expect(result, equals(const Right<Failure, void>(null)));
      verify(() =>
              dataSource.signInWithEmail(email: tEmail, password: tPassword))
          .called(1);
      verifyNoMoreInteractions(dataSource);
    });

    test(
        'should call [AuthRepositoryImpl.signInWithEmail] returns failure'
        'failure when AuthRemoteDatasource completes with exception', () async {
      //arrange
      when(() => dataSource.signInWithEmail(
              email: any(
                named: 'email',
              ),
              password: any(named: 'password')))
          .thenThrow(UnknownException('error'));

      //act
      final result =
          await repoImpl.signInWithEmail(email: tEmail, password: tPassword);

      //assert
      expect(result, isA<Left<Failure, void>>());
      expect((result as Left<Failure, void>).value.message, equals('error'));
      verify(() =>
              dataSource.signInWithEmail(email: tEmail, password: tPassword))
          .called(1);
      verifyNoMoreInteractions(dataSource);
    });
  });

  group('AuthRepository.resetPassword', () {
    test(
        'should [AuthRepository.resetPassword] return success message '
        'when AuthRempoteDatasource completes with success', () async {
      //arrange
      when(
        () => dataSource.resetPassword(any()),
      ).thenAnswer((_) async => Future.value());

      //act
      final result = await repoImpl.resetPassword('email');

      //assert
      expect(result, equals(Right<Failure, void>(null)));
      verify(
        () => dataSource.resetPassword('email'),
      ).called(1);
      verifyNoMoreInteractions(dataSource);
    });
    test(
        'should [AuthRepository.resetPassword] return [Failure] '
        'when AuthRempoteDatasource completes with Exception', () async {
      //arrange
      when(
        () => dataSource.resetPassword(any()),
      ).thenThrow(UnknownException('error message'));

      //act
      final result = await repoImpl.resetPassword('email');

      //assert
      expect(result, isA<Left<Failure, void>>());
      expect((result as Left<Failure, void>).value.message,
          equals('error message'));
      verify(
        () => dataSource.resetPassword('email'),
      ).called(1);
      verifyNoMoreInteractions(dataSource);
    });
  });

  group('AuthRepository.signInWithApple', () {
    test(
        'should [AuthRepository.signInWithApple] return success message '
        'when AuthRemoteDatasource completes with success', () async {
      //arrange
      when(
        () => dataSource.signInWithApple(),
      ).thenAnswer((_) async => Future.value());

      //act
      final result = await repoImpl.signInWithApple();

      //assert
      expect(result, equals(Right<Failure, void>(null)));
      verify(
        () => dataSource.signInWithApple(),
      ).called(1);
      verifyNoMoreInteractions(dataSource);
    });
    test(
        'should [AuthRepository.signInWithApple] return [Failure] '
        'when AuthRempoteDatasource completes with Exception', () async {
      //arrange
      when(
        () => dataSource.signInWithApple(),
      ).thenThrow(UnknownException('error message'));

      //act
      final result = await repoImpl.signInWithApple();

      //assert
      expect(result, isA<Left<Failure, void>>());
      expect((result as Left<Failure, void>).value.message,
          equals('error message'));
      verify(
        () => dataSource.signInWithApple(),
      ).called(1);
      verifyNoMoreInteractions(dataSource);
    });
  });

  group('AuthRepository.signInWithGoogle', () {
    test(
        'should [AuthRepository.signInWithGoogle] '
        'when AuthRemoteDatasource completes with success', () async {
      //arrange
      when(
        () => dataSource.signInWithGoogle(),
      ).thenAnswer((_) async => Future.value());

      //act
      final result = await repoImpl.signInWithGoogle();

      //assert
      expect(result, equals(Right<Failure, void>(null)));
      verify(
        () => dataSource.signInWithGoogle(),
      ).called(1);
      verifyNoMoreInteractions(dataSource);
    });
    test(
        'should [AuthRepository.signInWithGoogle] return [Failure] '
        'when AuthRempoteDatasource completes with Exception', () async {
      //arrange
      when(
        () => dataSource.signInWithGoogle(),
      ).thenThrow(UnknownException('error message'));

      //act
      final result = await repoImpl.signInWithGoogle();

      //assert
      expect(result, isA<Left<Failure, void>>());
      expect((result as Left<Failure, void>).value.message,
          equals('error message'));
      verify(
        () => dataSource.signInWithGoogle(),
      ).called(1);
      verifyNoMoreInteractions(dataSource);
    });
  });

  group('AuthRepository.signUpWithEmail', () {
    test(
        'should [AuthRepository.signUpWithEmail] '
        'when AuthRemoteDatasource completes with success', () async {
      //arrange
      when(() => dataSource.signUpWithEmail(
          email: any(named: 'email'),
          password: any(named: 'password'),
          firstName: any(named: 'firstName'),
          lastName: any(named: 'lastName'))).thenAnswer((_) async {});

      //act
      final result = await repoImpl.signUpWithEmail(
          email: tEmail,
          password: tPassword,
          firstName: tFirstName,
          lastName: tLastName);

      //assert
      expect(result, equals(Right<Failure, void>(null)));
      verify(
        () => dataSource.signUpWithEmail(
            email: tEmail,
            password: tPassword,
            firstName: tFirstName,
            lastName: tLastName),
      ).called(1);
      verifyNoMoreInteractions(dataSource);
    });
    test(
        'should [AuthRepository.signUpWithEmail] return [Failure] '
        'when AuthRempoteDatasource completes with Exception', () async {
      //arrange
      when(
        () => dataSource.signUpWithEmail(
            email: any(named: 'email'),
            password: any(named: 'password'),
            firstName: any(named: 'firstName'),
            lastName: any(named: 'lastName')),
      ).thenThrow(UnknownException('error message'));

      //act
      final result = await repoImpl.signUpWithEmail(
          email: tEmail,
          password: tPassword,
          firstName: tFirstName,
          lastName: tLastName);

      //assert
      expect(result, isA<Left<Failure, void>>());
      expect((result as Left<Failure, void>).value.message,
          equals('error message'));
      verify(
        () => dataSource.signUpWithEmail(
            email: tEmail,
            password: tPassword,
            firstName: tFirstName,
            lastName: tLastName),
      ).called(1);
      verifyNoMoreInteractions(dataSource);
    });
  });
}

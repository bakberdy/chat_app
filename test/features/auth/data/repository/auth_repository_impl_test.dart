import 'package:chat_app/core/error/exception.dart';
import 'package:chat_app/core/error/failure.dart';
import 'package:chat_app/features/auth/data/datasource/auth_remote_data_source.dart';
import 'package:chat_app/features/auth/data/models/sign_in_with_email_model.dart';
import 'package:chat_app/features/auth/data/models/sign_up_with_email_model.dart';
import 'package:chat_app/features/auth/data/repository/auth_repository_impl.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockAuthRemoteDataSource extends Mock implements AuthRemoteDataSource {}

void main() {
  late AuthRemoteDataSource dataSource;
  late AuthRepositoryImpl repoImpl;
  final SignInWithEmailModel signInParams =
      SignInWithEmailModel(email: 'test@gmail.com', password: 'password');
  final SignUpWithEmailModel signUpParams = SignUpWithEmailModel(
      email: 'test@gmail.com',
      password: 'password',
      firstName: 'firstName',
      lastName: 'lastName');

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
      when(() => dataSource.signInWithEmail(signInParams))
          .thenAnswer((_) async => Future.value());

      //act
      final result = await repoImpl.signInWithEmail(signInParams);

      //assert
      expect(result, equals(const Right<Failure, void>(null)));
      verify(() => dataSource.signInWithEmail(signInParams)).called(1);
      verifyNoMoreInteractions(dataSource);
    });

    test(
        'should call [AuthRepositoryImpl.signInWithEmail] returns failure'
        'failure when AuthRemoteDatasource completes with exception', () async {
      //arrange
      when(() => dataSource.signInWithEmail(signInParams))
          .thenThrow(UnknownException('error'));

      //act
      final result = await repoImpl.signInWithEmail(signInParams);

      //assert
      expect(result, isA<Left<Failure, void>>());
      expect((result as Left<Failure, void>).value.message, equals('error'));
      verify(() => dataSource.signInWithEmail(signInParams)).called(1);
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
      when(() => dataSource.signUpWithEmail(signUpParams))
          .thenAnswer((_) async {});

      //act
      final result = await repoImpl.signUpWithEmail(signUpParams);

      //assert
      expect(result, equals(Right<Failure, void>(null)));
      verify(
        () => dataSource.signUpWithEmail(signUpParams),
      ).called(1);
      verifyNoMoreInteractions(dataSource);
    });
    test(
        'should [AuthRepository.signUpWithEmail] return [Failure] '
        'when AuthRempoteDatasource completes with Exception', () async {
      //arrange
      when(
        () => dataSource.signUpWithEmail(signUpParams),
      ).thenThrow(UnknownException('error message'));

      //act
      final result = await repoImpl.signUpWithEmail(signUpParams);

      //assert
      expect(result, isA<Left<Failure, void>>());
      expect((result as Left<Failure, void>).value.message,
          equals('error message'));
      verify(
        () => dataSource.signUpWithEmail(signUpParams),
      ).called(1);
      verifyNoMoreInteractions(dataSource);
    });
  });
}

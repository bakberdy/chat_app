import 'package:chat_app/core/error/failure.dart';
import 'package:chat_app/features/auth/domain/repository/auth_repository.dart';
import 'package:chat_app/features/auth/domain/usecases/sign_in_with_email.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'auth_repository.mock.dart';

void main() {
  late SignInWithEmail usecase;
  late AuthRepository repository;

  setUp(() {
    repository = MockAuthRepository();
    usecase = SignInWithEmail(repository);
  });
  final tEmail = 'test@email.com';
  final tPassword = 'testPassword';
  test('should call the [AuthRepository.signInWithEmail] and returns a message',
      () async {
    // Arrange
    when(() => repository.signInWithEmail(
            email: any(named: 'email'), password: any(named: 'password')))
        .thenAnswer((_) async => const Right(null)); // Use async

    // Act
    final result =
        await usecase(SignInParams(email: tEmail, password: tPassword));

    // Assert
    expect(result, const Right<Failure, void>(null)); // Specify Failure type
    verify(() => repository.signInWithEmail(email: tEmail, password: tPassword))
        .called(1);
    verifyNoMoreInteractions(repository);
  });
}

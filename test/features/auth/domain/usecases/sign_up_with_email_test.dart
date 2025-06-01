import 'package:chat_app/core/core.dart';
import 'package:chat_app/features/auth/domain/repository/auth_repository.dart';
import 'package:chat_app/features/auth/domain/usecases/sign_up_with_email.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'auth_repository.mock.dart';

void main() {
  late SignUpWithEmail usecase;
  late AuthRepository repository;

  setUp(() {
    repository = MockAuthRepository();
    usecase = SignUpWithEmail(repository);
  });
  final tEmail = 'test@email.com';
  final tPassword = 'password';
  final tFirstName = 'test';
  final tLastName = 'test';
  test('should call the [AuthRepository.signUpWithEmail] and returns a message',
      () async {
    // Arrange
    when(() => repository.signUpWithEmail(
            email: any(named: 'email'),
            password: any(named: 'password'),
            firstName: any(named: 'firstName'),
            lastName: any(named: 'lastName')))
        .thenAnswer((_) async => const Right(null)); // Use async

    // Act
    final result = await usecase(SignUpParams(
        email: tEmail,
        password: tPassword,
        firstName: tFirstName,
        lastName: tLastName));

    // Assert
    expect(result, const Right<Failure, void>(null)); // Specify Failure type
    verify(() => repository.signUpWithEmail(
        email: tEmail,
        password: tPassword,
        firstName: tFirstName,
        lastName: tLastName)).called(1);
    verifyNoMoreInteractions(repository);
  });
}

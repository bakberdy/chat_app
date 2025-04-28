import 'package:chat_app/core/error/failure.dart';
import 'package:chat_app/features/auth/domain/repository/auth_repository.dart';
import 'package:chat_app/features/auth/domain/usecases/reset_password.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'auth_repository.mock.dart';


void main() {
  late ResetPassword resetPassword;
  late AuthRepository repository;

  setUp(() {
    repository = MockAuthRepository();
    resetPassword = ResetPassword(repository);
  });

  test('should call the [AuthRepository.resetPassword] and returns a message', () async {
    // Arrange
    const testEmail = 'test@example.com';
    when(() => repository.resetPassword(testEmail))
        .thenAnswer((_) async => const Right(null)); // Use async

    // Act
    final result = await resetPassword(testEmail);

    // Assert
    expect(result, const Right<Failure, void>(null)); // Specify Failure type
    verify(() => repository.resetPassword(testEmail)).called(1);
    verifyNoMoreInteractions(repository);
  });
}
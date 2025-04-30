import 'package:chat_app/core/error/failure.dart';
import 'package:chat_app/core/usecase/usecase.dart';
import 'package:chat_app/features/auth/domain/repository/auth_repository.dart';
import 'package:chat_app/features/auth/domain/usecases/sign_in_with_apple.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'auth_repository.mock.dart';


void main() {
  late SignInWithAppleUseCase usecase;
  late AuthRepository repository;

  setUp(() {
    repository = MockAuthRepository();
    usecase = SignInWithAppleUseCase(repository);
  });

  test('should call the [AuthRepository.signInWithApple] and returns a message', () async {
    // Arrange
    when(() => repository.signInWithApple())
        .thenAnswer((_) async => const Right(null)); // Use async

    // Act
    final result = await usecase(NoParams());

    // Assert
    expect(result, const Right<Failure, void>(null)); // Specify Failure type
    verify(() => repository.signInWithApple()).called(1);
    verifyNoMoreInteractions(repository);
  });
}
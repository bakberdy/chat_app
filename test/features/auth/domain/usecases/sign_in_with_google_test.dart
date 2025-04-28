import 'package:chat_app/core/error/failure.dart';
import 'package:chat_app/core/usecase/usecase.dart';
import 'package:chat_app/features/auth/domain/repository/auth_repository.dart';
import 'package:chat_app/features/auth/domain/usecases/sign_in_with_google.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'auth_repository.mock.dart';


void main() {
  late SignInWithGoogle usecase;
  late AuthRepository repository;

  setUp(() {
    repository = MockAuthRepository();
    usecase = SignInWithGoogle(repository);
  });

  test('should call the [AuthRepository.signInWithGoogle] and returns a message', () async {
    // Arrange
    when(() => repository.signInWithGoogle())
        .thenAnswer((_) async => const Right(null)); 

    // Act
    final result = await usecase(NoParams());

    // Assert
    expect(result, const Right<Failure, void>(null)); 
    verify(() => repository.signInWithGoogle()).called(1);
    verifyNoMoreInteractions(repository);
  });
}
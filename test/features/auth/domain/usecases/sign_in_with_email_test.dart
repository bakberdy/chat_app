import 'package:chat_app/core/error/failure.dart';
import 'package:chat_app/core/usecase/usecase.dart';
import 'package:chat_app/features/auth/domain/enitities/sign_in_with_email_entity.dart';
import 'package:chat_app/features/auth/domain/repository/auth_repository.dart';
import 'package:chat_app/features/auth/domain/usecases/sign_in_with_apple.dart';
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
  final params =
      SignInWithEmailEntity(email: 'test@email.com', password: 'password');
  test('should call the [AuthRepository.signInWithEmail] and returns a message', () async {
    // Arrange
    when(() => repository.signInWithEmail(params))
        .thenAnswer((_) async => const Right(null)); // Use async

    // Act
    final result = await usecase(params);

    // Assert
    expect(result,
        const Right<Failure, void>(null)); // Specify Failure type
    verify(() => repository.signInWithEmail(params)).called(1);
    verifyNoMoreInteractions(repository);
  });
}

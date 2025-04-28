import 'package:chat_app/core/error/failure.dart';
import 'package:chat_app/features/auth/domain/enitities/sign_up_with_email_entity.dart';
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
  final params = SignUpWithEmailEntity(
      email: 'test@email.com',
      password: 'password',
      firstName: 'test',
      lastName: 'test');
  test('should call the [AuthRepository.signUpWithEmail] and returns a message' , () async {
    // Arrange
    when(() => repository.signUpWithEmail(params))
        .thenAnswer((_) async => const Right(null)); // Use async

    // Act
    final result = await usecase(params);

    // Assert
    expect(result,
        const Right<Failure, void>(null)); // Specify Failure type
    verify(() => repository.signUpWithEmail(params)).called(1);
    verifyNoMoreInteractions(repository);
  });
}

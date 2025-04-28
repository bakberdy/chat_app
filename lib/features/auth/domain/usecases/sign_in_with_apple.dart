import 'package:chat_app/core/usecase/usecase.dart';
import 'package:chat_app/core/utils/typedef.dart';
import 'package:chat_app/features/auth/domain/repository/auth_repository.dart';

class SignInWithApple extends Usecase<void, NoParams>{
  final AuthRepository repository;

  SignInWithApple(this.repository);
  @override
  ResultFuture<void> call(NoParams p) {
    return repository.signInWithApple();
  }
}
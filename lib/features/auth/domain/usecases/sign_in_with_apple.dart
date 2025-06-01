import 'package:chat_app/core/usecase/usecase.dart';
import 'package:chat_app/core/utils/utils.dart';
import 'package:chat_app/features/auth/domain/repository/auth_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class SignInWithAppleUseCase extends Usecase<void, NoParams> {
  final AuthRepository repository;

  SignInWithAppleUseCase(this.repository);
  @override
  ResultFuture<void> call(NoParams p) {
    return repository.signInWithApple();
  }
}

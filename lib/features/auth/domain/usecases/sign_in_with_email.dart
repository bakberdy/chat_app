import 'package:chat_app/core/usecase/usecase.dart';
import 'package:chat_app/core/utils/typedef.dart';
import 'package:chat_app/features/auth/domain/enitities/sign_in_with_email_entity.dart';
import 'package:chat_app/features/auth/domain/repository/auth_repository.dart';

class SignInWithEmail extends Usecase<void, SignInWithEmailEntity>{
  final AuthRepository repository;

  SignInWithEmail(this.repository);
  @override
  ResultFuture<void> call(SignInWithEmailEntity p) {
    return repository.signInWithEmail(p);
  }
}
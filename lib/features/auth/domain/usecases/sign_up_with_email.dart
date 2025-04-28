import 'package:chat_app/core/usecase/usecase.dart';
import 'package:chat_app/core/utils/typedef.dart';
import 'package:chat_app/features/auth/domain/enitities/sign_up_with_email_entity.dart';
import 'package:chat_app/features/auth/domain/repository/auth_repository.dart';

class SignUpWithEmail extends Usecase<void, SignUpWithEmailEntity>{
  final AuthRepository repository;

  SignUpWithEmail(this.repository);
  @override
  ResultFuture<void> call(SignUpWithEmailEntity p) {
    return repository.signUpWithEmail(p);
  }
}
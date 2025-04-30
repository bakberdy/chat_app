import 'package:chat_app/core/usecase/usecase.dart';
import 'package:chat_app/core/utils/typedef.dart';
import 'package:chat_app/features/auth/domain/enitities/sign_in_with_email_entity.dart';
import 'package:chat_app/features/auth/domain/repository/auth_repository.dart';
import 'package:injectable/injectable.dart';


@singleton
class SignInWithEmail extends Usecase<void, SignInParams> {
  final AuthRepository repository;

  SignInWithEmail(this.repository);
  @override
  ResultFuture<void> call(SignInParams p) {
    return repository.signInWithEmail(email: p.email, password: p.password);
  }
}

class SignInParams {
  final String email;
  final String password;

  SignInParams({required this.email, required this.password});
}

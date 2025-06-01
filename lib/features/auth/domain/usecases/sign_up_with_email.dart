import 'package:chat_app/core/usecase/usecase.dart';
import 'package:chat_app/core/utils/utils.dart';
import 'package:chat_app/features/auth/domain/repository/auth_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class SignUpWithEmail extends Usecase<void, SignUpParams> {
  final AuthRepository repository;

  SignUpWithEmail(this.repository);
  @override
  ResultFuture<void> call(SignUpParams p) {
    return repository.signUpWithEmail(
        email: p.email,
        password: p.password,
        firstName: p.firstName,
        lastName: p.lastName);
  }
}

class SignUpParams {
  final String email;
  final String password;
  final String firstName;
  final String lastName;

  SignUpParams(
      {required this.email,
      required this.password,
      required this.firstName,
      required this.lastName});
}

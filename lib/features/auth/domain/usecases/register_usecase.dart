import 'package:chat_app/core/core.dart';
import 'package:chat_app/features/auth/domain/repository/auth_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class RegisterUsecase extends Usecase<String, RegisterParams> {
  final AuthRepository _authRepository;

  RegisterUsecase(this._authRepository);

  @override
  ResultFuture<String> call(RegisterParams params) {
    return _authRepository.register(
        email: params.email,
        password: params.password,
        firstName: params.firstName,
        lastName: params.lastName,
        username: params.username);
  }
}

class RegisterParams {
  final String email;
  final String username;
  final String firstName;
  final String lastName;
  final String password;

  RegisterParams(
      {required this.email,
      required this.username,
      required this.firstName,
      required this.lastName,
      required this.password});
}

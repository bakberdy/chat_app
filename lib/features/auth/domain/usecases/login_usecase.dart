import 'package:chat_app/core/usecase/usecase.dart';
import 'package:chat_app/core/utils/typedef.dart';
import 'package:chat_app/features/auth/domain/repository/auth_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class LoginUsecase extends Usecase<String, LoginParams> {
  final AuthRepository _authRepository;

  LoginUsecase(this._authRepository);

  @override
  ResultFuture<String> call(LoginParams params) {
    return _authRepository.login(
        emailOrUsername: params.emailOrUserName, password: params.password);
  }
}

class LoginParams {
  final String emailOrUserName;
  final String password;

  LoginParams({required this.emailOrUserName, required this.password});
}

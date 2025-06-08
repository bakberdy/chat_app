import 'package:chat_app/core/core.dart';
import 'package:chat_app/features/auth/domain/repository/auth_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class ChangePasswordUsecase extends Usecase<String, ChangeUserPasswordParams> {
  final AuthRepository _authRepository;

  ChangePasswordUsecase(this._authRepository);

  @override
  ResultFuture<String> call(ChangeUserPasswordParams params) {
    return _authRepository.changeUserPassword(
        oldPassword: params.oldPassword, newPassword: params.newPassword);
  }
}

class ChangeUserPasswordParams {
  final String newPassword;
  final String oldPassword;

  ChangeUserPasswordParams(
      {required this.newPassword, required this.oldPassword});
}

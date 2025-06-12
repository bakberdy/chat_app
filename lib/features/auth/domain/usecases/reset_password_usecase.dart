import 'package:chat_app/core/usecase/usecase.dart';
import 'package:chat_app/core/utils/typedef.dart';
import 'package:chat_app/features/auth/domain/repository/auth_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class ResetPasswordUsecase extends Usecase<String, String> {
  final AuthRepository _authRepository;

  ResetPasswordUsecase(this._authRepository);

  @override
  ResultFuture<String> call(String params) async {
    return await _authRepository.resetPassword(email: params);
  }
}

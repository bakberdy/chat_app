import 'package:chat_app/core/core.dart';
import 'package:chat_app/features/auth/domain/repository/auth_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class LogoutUsecase extends Usecase<String, NoParams> {
  final AuthRepository _authRepository;

  LogoutUsecase(this._authRepository);

  @override
  ResultFuture<String> call(NoParams params) {
    return _authRepository.logout();
  }
}

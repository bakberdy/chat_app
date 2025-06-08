import 'package:chat_app/core/core.dart';
import 'package:chat_app/features/auth/domain/repository/auth_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetMeUsecase extends Usecase<UserEntity, NoParams> {
  final AuthRepository _authRepo;

  GetMeUsecase(this._authRepo);

  @override
  ResultFuture<UserEntity> call(NoParams params) {
    return _authRepo.getMe();
  }
}

import 'package:chat_app/core/core.dart';
import 'package:chat_app/features/auth/domain/repository/auth_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class UpdateUserDataUsecase extends Usecase<String, UpdateProfileParams> {
  final AuthRepository _authRepository;

  UpdateUserDataUsecase(this._authRepository);

  @override
  ResultFuture<String> call(UpdateProfileParams params) {
    return _authRepository.updateUserData(
        firstName: params.firstName,
        lastName: params.lastName,
        username: params.username,
        birthDate: params.birthDate);
  }
}

class UpdateProfileParams {
  final String? username;
  final String? firstName;
  final String? lastName;
  final DateTime? birthDate;

  UpdateProfileParams(
      {required this.username,
      required this.firstName,
      required this.lastName,
      required this.birthDate});
}

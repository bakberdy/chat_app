import 'package:chat_app/core/usecase/usecase.dart';
import 'package:chat_app/core/utils/utils.dart';
import 'package:chat_app/features/settings/profile/domain/repository/profile_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class UpdateProfileData extends Usecase<void, UpdateProfileDataParams> {
  final ProfileRepository repo;

  UpdateProfileData(this.repo);
  @override
  ResultVoid call(UpdateProfileDataParams params) async {
    return await repo.updateProfileData(
        userId: params.userId,
        firstName: params.firstName,
        lastName: params.lastName,
        birtDate: params.birthDate);
  }
}

class UpdateProfileDataParams {
  final String userId;
  final String? firstName;
  final String? lastName;
  final String? birthDate;

  UpdateProfileDataParams(
      {required this.firstName,
      required this.userId,
      required this.lastName,
      required this.birthDate});
}

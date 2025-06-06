import 'package:chat_app/core/core.dart';
import 'package:chat_app/features/settings/profile/domain/repository/profile_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetUserProfile extends Usecase<UserEntity, String> {
  final ProfileRepository repo;

  GetUserProfile(this.repo);
  @override
  ResultFuture<UserEntity> call(String params) {
    return repo.getUserProfile(userId: params);
  }
}

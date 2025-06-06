import 'dart:io';

import 'package:chat_app/core/usecase/usecase.dart';
import 'package:chat_app/core/utils/typedef.dart';
import 'package:chat_app/features/settings/profile/domain/repository/profile_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class UpdateProfilePicture extends Usecase<void, UpdateProfilePictureParams> {
  final ProfileRepository repo;

  UpdateProfilePicture(this.repo);

  @override
  ResultFuture<void> call(UpdateProfilePictureParams params) {
    return repo.updateProfilePicture(
        picture: params.picture, userId: params.userId);
  }
}

class UpdateProfilePictureParams {
  final String userId;
  final File picture;

  UpdateProfilePictureParams({required this.userId, required this.picture});
}

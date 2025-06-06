import 'dart:io';

import 'package:chat_app/core/core.dart';

abstract interface class ProfileRepository {
  ResultVoid updateProfileData(
      {required String userId,
      String? firstName,
      String? lastName,
      String? birtDate});

  ResultVoid updateProfilePicture(
      {required String userId, required File picture});
  ResultFuture<UserEntity> getUserProfile({required String userId});
}

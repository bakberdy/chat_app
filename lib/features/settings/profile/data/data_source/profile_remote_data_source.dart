import 'dart:io';
import 'package:chat_app/core/core.dart';

abstract interface class ProfileRemoteDataSource {
  Future<void> updateProfilePicture(
      {required String userId, required File picture});
  Future<void> updateProfileData(
      {required String userId,
      String? firstName,
      String? lastName,
      String? birthDate});
  Future<UserModel> getUserProfile({required String userId});
}

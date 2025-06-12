import 'dart:io';

import 'package:chat_app/core/core.dart';
import 'package:chat_app/core/utils/utils.dart';
import 'package:chat_app/features/auth/domain/usecases/change_password_usecase.dart';

abstract class AuthRepository {
  ResultFuture<String> register({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
    required String username,
  });
  ResultFuture<String> login({
    required String emailOrUsername,
    required String password,
  });

  ResultFuture<UserEntity> getMe();
  ResultFuture<String> uploadProfilePicture({
    required File file,
  });
  ResultFuture<String> updateUserData({
    String? firstName,
    String? lastName,
    String? username,
    DateTime? birthDate,
  });

  ResultFuture<String> changeUserPassword({
    required String oldPassword,
    required String newPassword,
  });
  ResultFuture<String> logout();

  ResultFuture<String> resetPassword({required String email});
}

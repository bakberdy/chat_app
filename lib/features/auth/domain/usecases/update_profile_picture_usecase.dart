import 'dart:io';

import 'package:chat_app/core/core.dart';
import 'package:chat_app/features/auth/domain/repository/auth_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class UpdateProfilePictureUsecase extends Usecase<String, File> {
  final AuthRepository _authRepository;

  UpdateProfilePictureUsecase(this._authRepository);

  @override
  ResultFuture<String> call(File params) {
    return _authRepository.uploadProfilePicture(file: params);
  }
}

import 'dart:io';

import 'package:chat_app/core/core.dart';

import 'package:chat_app/features/settings/profile/data/data_source/profile_remote_data_source.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../domain/repository/profile_repository.dart';

@LazySingleton(as: ProfileRepository)
class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileRemoteDataSource _dataSource;

  ProfileRepositoryImpl(this._dataSource);

  @override
  ResultFuture<UserEntity> getUserProfile({required String userId}) async {
    try {
      final user = await _dataSource.getUserProfile(userId: userId);
      return Right(user);
    } on AppException catch (e) {
      return Left(UnknownFailure(e.message));
    } catch (e) {
      return Left(UnknownFailure(e.toString()));
    }
  }

  @override
  ResultVoid updateProfileData({
    required String userId,
    String? firstName,
    String? lastName,
    String? birtDate,
  }) async {
    try {
      await _dataSource.updateProfileData(
        userId: userId,
        firstName: firstName,
        lastName: lastName,
        birthDate: birtDate,
      );
      return Right(null);
    } on AppException catch (e) {
      return Left(UnknownFailure(e.message));
    } catch (e) {
      return Left(UnknownFailure(e.toString()));
    }
  }

  @override
  ResultVoid updateProfilePicture(
      {required String userId, required File picture}) async {
    try {
      await _dataSource.updateProfilePicture(userId: userId, picture: picture);
      return Right(null);
    } on AppException catch (e) {
      return Left(UnknownFailure(e.message));
    } catch (e) {
      return Left(UnknownFailure(e.toString()));
    }
  }
}

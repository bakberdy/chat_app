//app dependencies
import 'dart:io';

import 'package:chat_app/core/core.dart';
import 'package:chat_app/features/auth/data/datasource/remote/auth_remote_data_source.dart';
import 'package:chat_app/features/auth/domain/repository/auth_repository.dart';

//external dependencies
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource _authRemoteDataSource;
  final TokenStorage _tokenStorage;
  const AuthRepositoryImpl(this._authRemoteDataSource, this._tokenStorage);

  @override
  ResultFuture<String> changeUserPassword(
      {required String oldPassword, required String newPassword}) async {
    try {
      return await _authRemoteDataSource
          .changePassword(
            oldPassword: oldPassword,
            newPassword: newPassword,
          )
          .then((value) => Right(value));
    } on DioException catch (e) {
      return Future.value(
        Left(DioFailure.fromDioException(e)),
      );
    } catch (e) {
      return Future.value(Left(UnknownFailure(e.toString())));
    }
  }

  @override
  ResultFuture<UserEntity> getMe() async {
    try {
      final user = await _authRemoteDataSource.getMe();
      return Right(user);
    } on DioException catch (e) {
      return Future.value(Left(DioFailure.fromDioException(e)));
    } catch (e) {
      return Future.value(Left(UnknownFailure(e.toString())));
    }
  }

  @override
  ResultFuture<String> login(
      {required String emailOrUsername, required String password}) async {
    try {
      final tokens = await _authRemoteDataSource.login(
          emailOrUsername: emailOrUsername, password: password);
      await _tokenStorage.saveAccessToken(tokens.accessToken);
      await _tokenStorage.saveRefreshToken(tokens.refreshToken);
      return Right('Logined successfully');
    } on DioException catch (e) {
      return Future.value(Left(DioFailure.fromDioException(e)));
    } on TokenException catch (e) {
      return Future.value(Left(TokenFailure.fromTokenException(e)));
    } catch (e) {
      return Future.value(Left(UnknownFailure(e.toString())));
    }
  }

  @override
  ResultFuture<String> logout() async {
    try {
      final message = await _authRemoteDataSource.logout();
      _tokenStorage.clearToken();
      return Right(message);
    } on DioException catch (e) {
      return Future.value(Left(DioFailure.fromDioException(e)));
    } catch (e) {
      return Future.value(Left(UnknownFailure(e.toString())));
    }
  }

  @override
  ResultFuture<String> register(
      {required String email,
      required String password,
      required String firstName,
      required String lastName,
      required String username}) async {
    try {
      return await _authRemoteDataSource
          .register(
              email: email,
              password: password,
              firstName: firstName,
              lastName: lastName,
              username: username)
          .then((tokens) async {
        await _tokenStorage.saveAccessToken(tokens.accessToken);
        await _tokenStorage.saveRefreshToken(tokens.refreshToken);
        return Right('Registred successfully');
      });
    } on DioException catch (e) {
      return Future.value(Left(DioFailure.fromDioException(e)));
    } on TokenException catch (e) {
      return Future.value(Left(TokenFailure.fromTokenException(e)));
    } catch (e) {
      return Future.value(Left(UnknownFailure(e.toString())));
    }
  }

  @override
  ResultFuture<String> updateUserData(
      {String? firstName,
      String? lastName,
      String? username,
      String? birthDate}) async {
    try {
      return await _authRemoteDataSource
          .updateUserData(
              birthDate: birthDate,
              firstName: firstName,
              lastName: lastName,
              username: username)
          .then((message) => Right(message));
    } on DioException catch (e) {
      return Future.value(Left(DioFailure.fromDioException(e)));
    } catch (e) {
      return Future.value(Left(UnknownFailure(e.toString())));
    }
  }

  @override
  ResultFuture<String> uploadProfilePicture({required File file}) async {
    try {
      return await _authRemoteDataSource
          .uploadProfilePicture(file: file)
          .then((message) => Right(message));
    } on DioException catch (e) {
      return Future.value(Left(DioFailure.fromDioException(e)));
    } catch (e) {
      return Future.value(Left(UnknownFailure(e.toString())));
    }
  }
}

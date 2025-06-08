import 'dart:io';
import 'dart:math';

import 'package:chat_app/core/core.dart';
import 'package:chat_app/features/auth/data/models/tokens_model.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

abstract class AuthRemoteDataSource {
  Future<TokensModel> register({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
    required String username,
  });

  Future<TokensModel> login({
    required String emailOrUsername,
    required String password,
  });

  Future<UserModel> getMe();

  Future<String> updateUserData({
    String? firstName,
    String? lastName,
    String? username,
    String? birthDate,
  });

  Future<String> uploadProfilePicture({required File file});

  Future<TokensModel> refreshToken({required String refreshToken});

  Future<String> changePassword({
    required String oldPassword,
    required String newPassword,
  });

  Future<String> logout();
}

@Singleton(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final DioClient _dioClient;

  AuthRemoteDataSourceImpl(this._dioClient);

  @override
  Future<String> changePassword(
      {required String oldPassword, required String newPassword}) async {
    try {
      final response = await _dioClient.patch(
        ApiEndpoints.changePassword,
        data: {
          'old_password': oldPassword,
          'new_password': newPassword,
        },
        options: Options(
          extra: {
            'enableAuthInterceptor': true,
          },
        ),
      );

      final message = response.data['message'] as String? ??
          'Password changed successfully';
      return message;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<UserModel> getMe() {
    return _dioClient
        .get(
      ApiEndpoints.me,
      options: Options(extra: {'enableAuthInterceptor': true}),
    )
        .then((response) {
      return UserModel.fromJson(response.data);
    });
  }

  @override
  Future<TokensModel> login(
      {required String emailOrUsername, required String password}) {
    return _dioClient.post(
      ApiEndpoints.login,
      data: {
        'email_or_username': emailOrUsername,
        'password': password,
      },
    ).then((response) {
      return TokensModel.fromJson(response.data);
    });
  }

  @override
  Future<String> logout() {
    return _dioClient
        .post(
      ApiEndpoints.logout,
      options: Options(
        extra: {'enableAuthInterceptor': true},
      ),
    )
        .then((response) {
      return response.data['message'] as String? ?? 'Logged out successfully';
    }).catchError((error) {
      throw Exception('Error logging out: $error');
    });
  }

  @override
  Future<TokensModel> refreshToken({required String refreshToken}) {
    return _dioClient
        .post(
      ApiEndpoints.refreshToken,
      data: {'refresh_token': refreshToken},
      options: Options(
        extra: {'enableAuthInterceptor': true},
      ),
    )
        .then((response) {
      return TokensModel.fromJson(response.data);
    });
  }

  @override
  Future<TokensModel> register(
      {required String email,
      required String password,
      required String firstName,
      required String lastName,
      required String username}) {
    return _dioClient.post(
      ApiEndpoints.register,
      data: {
        'email': email,
        'password': password,
        'first_name': firstName,
        'last_name': lastName,
        'username': username,
      },
    ).then((response) {
      return TokensModel.fromJson(response.data);
    });
  }

  @override
  Future<String> updateUserData(
      {String? firstName,
      String? lastName,
      String? username,
      String? birthDate}) {
    return _dioClient
        .patch(
      ApiEndpoints.userData,
      data: {
        'first_name': firstName,
        'last_name': lastName,
        'username': username,
        'birth_date': birthDate,
      },
      options: Options(
        extra: {'enableAuthInterceptor': true},
      ),
    )
        .then((response) {
      return response.data['message'];
    });
  }

  @override
  Future<String> uploadProfilePicture({required File file}) {
    final fileName =
        '${DateTime.now().millisecondsSinceEpoch}_${Random().nextInt(10000)}.${file.path.split('.').last}';
    final formData = FormData.fromMap({
      'picture': MultipartFile.fromFileSync(file.path, filename: fileName),
    });

    return _dioClient
        .post(
      ApiEndpoints.uploadProfilePicture,
      data: formData,
      options: Options(
        extra: {'enableAuthInterceptor': true},
      ),
    )
        .then((response) {
      return response.data['message'] as String? ??
          'Image uploaded successfully';
    });
  }
}

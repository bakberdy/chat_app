import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiEndpoints {
  static final String baseUrl = dotenv.get('API_BASE_URL');

  //authentication endpoints
  static final String register = '$baseUrl/api/v1/auth/register';
  static final String login = '$baseUrl/api/v1/auth/login';
  static final String me = '$baseUrl/api/v1/auth/me';
  static final String userData = '$baseUrl/api/v1/auth/user-data';
  static final String uploadProfilePicture =
      '$baseUrl/api/v1/auth/upload-profile-picture';
  static final String refreshToken = '$baseUrl/api/v1/auth/refresh-token';
  static final String changePassword = '$baseUrl/api/v1/auth/change-password';
  static final String logout = '$baseUrl/api/v1/auth/logout';
  static final String resetPassword =
      '$baseUrl/api/v1/auth/request-password-reset';
}

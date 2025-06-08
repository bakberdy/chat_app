import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiEndpoints {
  static final String baseUrl = dotenv.get('API_BASE_URL');

  //authentication endpoints
  static final String register = '$baseUrl/api/v1/auth/register';
  static final String login = '$baseUrl/api/v1/auth/login';
  static final String me = '$baseUrl/api/v1/auth/me';
  static final String userData = '$baseUrl/api/v1/auth/user_data';
  static final String uploadProfilePicture =
      '$baseUrl/api/v1/auth/upload_profile_picture';
  static final String refreshToken = '$baseUrl/api/v1/auth/refresh_token';
  static final String changePassword = '$baseUrl/api/v1/auth/change_password';
  static final String logout = '$baseUrl/api/v1/auth/logout';
}

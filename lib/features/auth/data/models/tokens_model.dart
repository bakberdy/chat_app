
import 'package:chat_app/features/auth/domain/enities/tokens_entity.dart';

class TokensModel extends TokensEntity{
  TokensModel({required super.tokenType, required super.accessToken, required super.refreshToken});
  factory TokensModel.fromJson(Map<String, dynamic> json) {
    return TokensModel(
      tokenType: json['token_type'] as String,
      accessToken: json['access_token'] as String,
      refreshToken: json['refresh_token'] as String,
    );
  }
}
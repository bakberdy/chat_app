class TokensEntity {
  final String accessToken;
  final String refreshToken;
  final String tokenType;

  TokensEntity( {
    required this.tokenType,
    required this.accessToken,
    required this.refreshToken,
  });

  factory TokensEntity.empty() {
    return TokensEntity(
      tokenType: '',
      accessToken: '',
      refreshToken: '',
    );
  }
}
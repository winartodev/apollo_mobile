class AuthEntity {
  final String accessToken;
  final String refreshToken;
  final String redirectionLink;

  AuthEntity({
    required this.accessToken,
    required this.refreshToken,
    required this.redirectionLink,
  });
}

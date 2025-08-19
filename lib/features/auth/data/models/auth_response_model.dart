class AuthResponseModel {
  final String accessToken;
  final String refreshToken;
  final String redirectionLink;

  AuthResponseModel({
    required this.accessToken,
    required this.refreshToken,
    required this.redirectionLink,
  });

  factory AuthResponseModel.fromJson(Map<String, dynamic> json) {
    return AuthResponseModel(
      accessToken: json['access_token'],
      refreshToken: json['refresh_token'],
      redirectionLink: json['redirection_link'] ?? '',
    );
  }

  @override
  String toString() {
    return 'AuthResponseModel{'
        'accessToken: $accessToken, '
        'refreshToken: $refreshToken, '
        'redirectionLink: $redirectionLink'
        '}';
  }
}

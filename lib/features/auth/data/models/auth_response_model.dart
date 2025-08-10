class AuthResponseModel {
  final String accessToken;
  final String refreshToken;

  AuthResponseModel({required this.accessToken, required this.refreshToken});

  factory AuthResponseModel.fromJson(Map<String, dynamic> json) {
    return AuthResponseModel(
      accessToken: json['access_token'],
      refreshToken: json['refresh_token'],
    );
  }
}

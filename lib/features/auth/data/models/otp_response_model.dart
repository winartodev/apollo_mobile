class OtpResponseModel {
  final int retryAttemptLeft;
  final int expiresIn;
  final int retryAfterIn;
  final bool isValid;
  String? redirectionLink;

  OtpResponseModel({
    required this.retryAttemptLeft,
    required this.expiresIn,
    required this.retryAfterIn,
    required this.isValid,
    this.redirectionLink,
  });

  factory OtpResponseModel.fromJson(Map<String, dynamic> json) {
    return OtpResponseModel(
      retryAttemptLeft: json['retry_attempts_left'] ?? 0,
      expiresIn: json['expires_in'] ?? 0,
      retryAfterIn: json['retry_after_seconds'] ?? 0,
      isValid: json['is_valid'],
      redirectionLink: json['redirection_link'] ?? '/',
    );
  }

  @override
  String toString() {
    return 'OtpResponseModel{'
        'retry_attempts_left: $retryAttemptLeft, '
        'expires_in: $expiresIn, '
        'retry_after_seconds: $retryAfterIn'
        '}';
  }
}

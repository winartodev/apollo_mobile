class OtpResponseModel {
  final int retryAttemptLeft;
  final int expiresIn;
  final int retryAfterIn;
  final bool isValid;

  OtpResponseModel({
    required this.retryAttemptLeft,
    required this.expiresIn,
    required this.retryAfterIn,
    required this.isValid,
  });

  factory OtpResponseModel.fromJson(Map<String, dynamic> json) {
    return OtpResponseModel(
      retryAttemptLeft: json['retry_attempts_left'],
      expiresIn: json['expires_in'],
      retryAfterIn: json['retry_after_seconds'],
      isValid: json['is_valid'],
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

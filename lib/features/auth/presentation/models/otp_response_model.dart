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
}

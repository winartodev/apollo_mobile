class OtpEntity {
  final int retryAttemptLeft;
  final int expiresIn;
  final int retryAfterIn;
  final bool isValid;

  OtpEntity({
    required this.retryAttemptLeft,
    required this.expiresIn,
    required this.retryAfterIn,
    required this.isValid,
  });
}

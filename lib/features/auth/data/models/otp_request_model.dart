class OtpRequestModel {
  final int otpNumber;

  OtpRequestModel({required this.otpNumber});

  Map<String, dynamic> toJson() => {"otp": otpNumber};
}

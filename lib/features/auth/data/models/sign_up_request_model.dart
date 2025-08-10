class SignUpRequestModel {
  final String username;
  final String password;
  final String email;
  final String phoneNumber;

  SignUpRequestModel({
    required this.username,
    required this.password,
    required this.email,
    required this.phoneNumber,
  });

  Map<String, dynamic> toJson() => {
    "username": username,
    "password": password,
    "email": email,
    "phone_number": phoneNumber,
  };
}

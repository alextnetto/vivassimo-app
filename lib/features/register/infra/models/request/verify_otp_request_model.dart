import 'dart:convert';

class VerifyOtpRequestModel {
  final String token;
  final String phoneNumber;

  VerifyOtpRequestModel({
    required this.token,
    required this.phoneNumber,
  });

  Map<String, dynamic> toMap() {
    return {
      'token': token,
      'phoneNumber': phoneNumber,
    };
  }

  factory VerifyOtpRequestModel.fromMap(Map<String, dynamic> map) {
    return VerifyOtpRequestModel(
      token: map['token'] ?? '',
      phoneNumber: map['phoneNumber'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory VerifyOtpRequestModel.fromJson(String source) => VerifyOtpRequestModel.fromMap(json.decode(source));
}

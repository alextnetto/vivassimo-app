import 'dart:convert';

class VerifyOtpRequestModel {
  final String otp;
  final String phoneNumber;

  VerifyOtpRequestModel({
    required this.otp,
    required this.phoneNumber,
  });

  Map<String, dynamic> toMap() {
    return {
      'otp': otp,
      'phoneNumber': phoneNumber,
    };
  }

  factory VerifyOtpRequestModel.fromMap(Map<String, dynamic> map) {
    return VerifyOtpRequestModel(
      otp: map['otp'] ?? '',
      phoneNumber: map['phoneNumber'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory VerifyOtpRequestModel.fromJson(String source) =>
      VerifyOtpRequestModel.fromMap(json.decode(source));
}

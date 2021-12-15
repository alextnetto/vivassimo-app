import 'dart:convert';

class SendOtpRequestModel {
  final String phoneNumber;

  SendOtpRequestModel({required this.phoneNumber});

  Map<String, dynamic> toMap() {
    return {
      'phoneNumber': phoneNumber,
    };
  }

  factory SendOtpRequestModel.fromMap(Map<String, dynamic> map) {
    return SendOtpRequestModel(
      phoneNumber: map['phoneNumber'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory SendOtpRequestModel.fromJson(String source) =>
      SendOtpRequestModel.fromMap(json.decode(source));
}

import 'dart:convert';

import 'package:equatable/equatable.dart';

class VerifyOtpRequestModel extends Equatable {
  final String token;
  final String phoneNumber;

  const VerifyOtpRequestModel({
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

  @override
  List<Object?> get props => [token, phoneNumber];
}

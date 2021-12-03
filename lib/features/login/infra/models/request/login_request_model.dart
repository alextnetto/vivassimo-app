import 'dart:convert';

class LoginRequestModel {
  String phoneNumber;
  String password;

  LoginRequestModel({required this.phoneNumber, required this.password});

  Map<String, dynamic> toMap() {
    return {
      'phoneNumber': phoneNumber,
      'password': password,
    };
  }

  factory LoginRequestModel.fromMap(Map<String, dynamic> map) {
    return LoginRequestModel(
      phoneNumber: map['phoneNumber'],
      password: map['password'],
    );
  }

  String toJson() => json.encode(toMap());

  factory LoginRequestModel.fromJson(String source) =>
      LoginRequestModel.fromMap(json.decode(source));
}

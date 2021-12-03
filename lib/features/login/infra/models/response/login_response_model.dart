import 'dart:convert';

import 'package:my_app/features/login/domain/entities/login_entity.dart';

class LoginResponseModel extends LoginEntity {
  const LoginResponseModel({required String token}) : super(token: token);

  Map<String, dynamic> toMap() {
    return {
      'token': token,
    };
  }

  factory LoginResponseModel.fromMap(Map<String, dynamic> map) {
    return LoginResponseModel(
      token: map['token'],
    );
  }

  String toJson() => json.encode(toMap());

  factory LoginResponseModel.fromJson(String source) =>
      LoginResponseModel.fromMap(json.decode(source));
}

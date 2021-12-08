import 'dart:convert';

import 'package:my_app/core/contracts/i_response_model_default.dart';
import 'package:my_app/features/login/domain/entities/login_entity.dart';

class LoginResponseModel extends LoginEntity implements IResponseModelDefault {
  @override
  final String message;

  @override
  final bool success;

  const LoginResponseModel({
    this.message = '',
    this.success = false,
    String? token,
  }) : super(token: token);

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

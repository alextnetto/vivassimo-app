import 'dart:convert';
import 'package:equatable/equatable.dart';
import 'package:my_app/core/contracts/i_response_model_default.dart';

class RegisterUserResponseModel extends Equatable implements IResponseModelDefault {
  @override
  final String message;

  @override
  final bool success;

  const RegisterUserResponseModel({
    this.message = '',
    this.success = false,
  });

  Map<String, dynamic> toMap() {
    return {
      'message': message,
      'success': success,
    };
  }

  factory RegisterUserResponseModel.fromMap(Map<String, dynamic> map) {
    return RegisterUserResponseModel(
      message: map['message'] ?? '',
      success: map['success'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory RegisterUserResponseModel.fromJson(String source) => RegisterUserResponseModel.fromMap(json.decode(source));

  @override
  List<Object?> get props => [message, success];
}

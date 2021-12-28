import 'dart:convert';

import 'package:my_app/core/contracts/i_response_model_default.dart';

class SendOtpResponseModel implements IResponseModelDefault {
  @override
  final String message;

  @override
  final bool success;

  SendOtpResponseModel({
    this.message = '',
    this.success = false,
  });

  Map<String, dynamic> toMap() {
    return {
      'message': message,
      'success': success,
    };
  }

  factory SendOtpResponseModel.fromMap(Map<String, dynamic> map) {
    return SendOtpResponseModel(
      message: map['message'] ?? '',
      success: map['success'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory SendOtpResponseModel.fromJson(String source) =>
      SendOtpResponseModel.fromMap(json.decode(source));
}

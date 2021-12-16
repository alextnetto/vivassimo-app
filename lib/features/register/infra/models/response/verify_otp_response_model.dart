import 'dart:convert';

import 'package:my_app/core/contracts/i_response_model_default.dart';

class VerifyOtpResponseModel implements IResponseModelDefault {
  @override
  final String message;

  @override
  final bool success;

  VerifyOtpResponseModel({
    this.message = '',
    this.success = false,
  });

  Map<String, dynamic> toMap() {
    return {
      'message': message,
      'success': success,
    };
  }

  factory VerifyOtpResponseModel.fromMap(Map<String, dynamic> map) {
    return VerifyOtpResponseModel(
      message: map['message'] ?? '',
      success: map['success'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory VerifyOtpResponseModel.fromJson(String source) =>
      VerifyOtpResponseModel.fromMap(json.decode(source));
}

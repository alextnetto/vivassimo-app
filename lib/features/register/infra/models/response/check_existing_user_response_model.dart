import 'dart:convert';

import 'package:my_app/core/contracts/i_response_model_default.dart';

class CheckExistingUserResponseModel implements IResponseModelDefault {
  @override
  final String message;

  @override
  final bool success;

  final bool userExists;

  CheckExistingUserResponseModel({
    this.userExists = false,
    this.message = '',
    this.success = false,
  });

  Map<String, dynamic> toMap() {
    return {
      'message': message,
      'success': success,
      'userExists': userExists,
    };
  }

  factory CheckExistingUserResponseModel.fromMap(Map<String, dynamic> map) {
    return CheckExistingUserResponseModel(
      message: map['message'] ?? '',
      success: map['success'] ?? false,
      userExists: map['userExists'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory CheckExistingUserResponseModel.fromJson(String source) =>
      CheckExistingUserResponseModel.fromMap(json.decode(source));
}

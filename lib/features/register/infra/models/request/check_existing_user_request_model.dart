import 'dart:convert';

class CheckExistingUserRequestModel {
  final String phoneNumber;

  CheckExistingUserRequestModel({required this.phoneNumber});

  Map<String, dynamic> toMap() {
    return {
      'phoneNumber': phoneNumber,
    };
  }

  factory CheckExistingUserRequestModel.fromMap(Map<String, dynamic> map) {
    return CheckExistingUserRequestModel(
      phoneNumber: map['phoneNumber'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory CheckExistingUserRequestModel.fromJson(String source) =>
      CheckExistingUserRequestModel.fromMap(json.decode(source));
}

import 'dart:convert';

class UserModel {
  final int? id;
  final String? name;
  final String? phoneNumber;

  UserModel({this.id, this.name, this.phoneNumber});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'telefone': phoneNumber,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id']?.toInt(),
      name: map['name'],
      phoneNumber: map['telefone'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source));
}

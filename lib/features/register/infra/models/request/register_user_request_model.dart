import 'dart:convert';

import 'package:my_app/core/entities/delivery_address_entity.dart';

class RegisterUserRequestModel {
  String? name;
  String? email;
  String? phoneNumber;
  String? password;
  String? gender;
  String? cpf;
  String? birthDate;
  AddressEntity? address;

  RegisterUserRequestModel({
    this.name,
    this.email,
    this.phoneNumber,
    this.password,
    this.gender,
    this.cpf,
    this.birthDate,
    this.address,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'phoneNumber': phoneNumber,
      'password': password,
      'gender': gender,
      'cpf': cpf,
      'birthDate': birthDate,
      'address': address?.toMap(),
    };
  }

  factory RegisterUserRequestModel.fromMap(Map<String, dynamic> map) {
    return RegisterUserRequestModel(
      name: map['name'],
      email: map['email'],
      phoneNumber: map['phoneNumber'],
      password: map['password'],
      gender: map['gender'],
      cpf: map['cpf'],
      birthDate: map['birthDate'],
      address: map['address'] != null ? AddressEntity.fromMap(map['address']) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory RegisterUserRequestModel.fromJson(String source) => RegisterUserRequestModel.fromMap(json.decode(source));
}

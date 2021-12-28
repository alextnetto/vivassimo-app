import 'dart:convert';

import 'package:my_app/core/entities/delivery_address_entity.dart';

class RegisterUserRequestModel {
  String? name;
  String? email;
  String? phoneNumber;
  String? password;
  String? genero;
  String? cpf;
  String? dataNascimento;
  DeliveryAddressEntity? deliveryAddress;

  RegisterUserRequestModel({
    this.name,
    this.email,
    this.phoneNumber,
    this.password,
    this.genero,
    this.cpf,
    this.dataNascimento,
    this.deliveryAddress,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'phoneNumber': phoneNumber,
      'password': password,
      'genero': genero,
      'cpf': cpf,
      'dataNascimento': dataNascimento,
      'deliveryAddress': deliveryAddress?.toMap(),
    };
  }

  factory RegisterUserRequestModel.fromMap(Map<String, dynamic> map) {
    return RegisterUserRequestModel(
      name: map['name'],
      email: map['email'],
      phoneNumber: map['phoneNumber'],
      password: map['password'],
      genero: map['genero'],
      cpf: map['cpf'],
      dataNascimento: map['dataNascimento'],
      deliveryAddress: map['deliveryAddress'] != null
          ? DeliveryAddressEntity.fromMap(map['deliveryAddress'])
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory RegisterUserRequestModel.fromJson(String source) =>
      RegisterUserRequestModel.fromMap(json.decode(source));
}
